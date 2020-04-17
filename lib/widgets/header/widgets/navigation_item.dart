import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;

  NavigationItem(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final active = ModalRoute.of(context).settings.name == routeName;

    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 0,
        right: 20,
      ),
      child: MaterialButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(routeName),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: active ? Theme.of(context).accentColor : Theme.of(context).primaryColorDark,
        child: Text(
          title,
          style: Theme.of(context).accentTextTheme.headline6.apply(
                fontSizeDelta: -2,
              ),
        ),
      ),
    );
  }
}
