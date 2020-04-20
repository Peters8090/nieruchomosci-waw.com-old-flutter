import 'package:flutter/widgets.dart';
import 'package:nieruchomosci_waw_com/widgets/utility/constants.dart';


// credits https://pub.dev/packages/responsive_grid

double _refWidth = 375;

double _scalingFactor;
double _width;


void initScaling(BuildContext context){
  var mq = MediaQuery.of(context);
  _width = mq.size.width < mq.size.height ? mq.size.width : mq.size.height;
  _scalingFactor = _width / _refWidth;

  print("width => $_width");
}

double scale(double dimension){
  if (_width == null){
    throw Exception("You must call init() before any use of scale()");
  }
  //
  return dimension * _scalingFactor;
}


//
// responsive grid layout
//

enum _GridTier { lower, bigger }

_GridTier _currentSize(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  double width = mediaQueryData.size.width;

//  print(
//      "INFO orientation: ${mediaQueryData.orientation} , width: ${mediaQueryData.size.width}, height: ${mediaQueryData.size.height}");

  if (width < mobileBreakpoint)
    return _GridTier.lower;
  else
    return _GridTier.bigger;
}

int _totalSegments = 12;

class ResponsiveGridRow extends StatelessWidget {
  final List<ResponsiveGridCol> children;

  ResponsiveGridRow({@required this.children});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = List<Widget>();

    int accumulatedWidth = 0;
    List<Widget> cols = List<Widget>();

    children.forEach((col) {
      var colWidth = col.currentConfig(context);
      //
      if (accumulatedWidth + colWidth > _totalSegments) {
        if (accumulatedWidth < _totalSegments) {
          cols.add(Spacer(
            flex: _totalSegments - accumulatedWidth,
          ));
        }
        rows.add(Row(
          children: cols,
        ));
        // clear
        cols = List<Widget>();
        accumulatedWidth = 0;
      }
      //
      cols.add(col);
      accumulatedWidth += colWidth;
    });

    if (accumulatedWidth >= 0) {
      if (accumulatedWidth < _totalSegments) {
        cols.add(Spacer(
          flex: _totalSegments - accumulatedWidth,
        ));
      }
      rows.add(Row(
        children: cols,
      ));
    }

    return Column(
      children: rows,
    );
  }
}

class ResponsiveGridCol extends StatelessWidget {
  final List<int> _config = new List(5);
  final Widget child;

  ResponsiveGridCol(
      {int bigger=12, int lower, @required this.child}) {
    _config[_GridTier.bigger.index] = bigger;
    _config[_GridTier.lower.index] = lower ?? _config[_GridTier.lower.index];
  }

  int currentConfig(BuildContext context) {
    return _config[_currentSize(context).index];
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: currentConfig(context),
      fit: FlexFit.tight,
      child: child,
    );
  }
}

//
// responsive grid list
//

class ResponsiveGridList extends StatelessWidget {
  final double desiredItemWidth, minSpacing;
  final List<Widget> children;
  final bool squareCells, scroll;

  ResponsiveGridList(
      {this.desiredItemWidth,
        this.minSpacing,
        this.squareCells = false,
        this.scroll = true,
        this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (children.length == 0) return Container();

        double width = constraints.maxWidth;

        double N = (width - minSpacing) / (desiredItemWidth + minSpacing);

        int n;
        double spacing, itemWidth;

        if (N % 1 == 0) {
          n = N.floor();
          spacing = minSpacing;
          itemWidth = desiredItemWidth;
        } else {
          n = N.floor();

          double dw =
              width - (n * (desiredItemWidth + minSpacing) + minSpacing);

          itemWidth = desiredItemWidth +
              (dw / n) * (desiredItemWidth / (desiredItemWidth + minSpacing));

          spacing = (width - itemWidth * n) / (n + 1);
        }

        if (scroll) {
          return ListView.separated(
              itemCount: (children.length / n).ceil(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: minSpacing,
                );
              },
              itemBuilder: (context, index) {
                if (index * n >= children.length) return null;
                //
                var rowChildren = List<Widget>();
                for (int i = index * n; i < (index + 1) * n; i++) {
                  if (i >= children.length) break;
                  rowChildren.add(children[i]);
                }
                return _ResponsiveGridListItem(
                  itemWidth: itemWidth,
                  spacing: spacing,
                  squareCells: squareCells,
                  children: rowChildren,
                );
              });
        } else {
          var rows = List<Widget>();
          rows.add(SizedBox(
            height: minSpacing,
          ));
          //
          for (int j = 0; j < (children.length / n).ceil(); j++) {
            var rowChildren = List<Widget>();
            //
            for (int i = j * n; i < (j + 1) * n; i++) {
              if (i >= children.length) break;
              rowChildren.add(children[i]);
            }
            //
            rows.add(_ResponsiveGridListItem(
              itemWidth: itemWidth,
              spacing: spacing,
              squareCells: squareCells,
              children: rowChildren,
            ));

            rows.add(SizedBox(
              height: minSpacing,
            ));
          }

          return Column(
            children: rows,
          );
        }
      },
    );
  }
}

class _ResponsiveGridListItem extends StatelessWidget {
  final double spacing, itemWidth;
  final List<Widget> children;
  final bool squareCells;

  _ResponsiveGridListItem(
      {this.itemWidth, this.spacing, this.squareCells, this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    var list = List<Widget>();

    list.add(SizedBox(
      width: spacing,
    ));

    children.forEach((child) {
      list.add(SizedBox(
        width: itemWidth,
        height: squareCells ? itemWidth : null,
        child: child,
      ));
      list.add(SizedBox(
        width: spacing,
      ));
    });

    return list;
  }
}
