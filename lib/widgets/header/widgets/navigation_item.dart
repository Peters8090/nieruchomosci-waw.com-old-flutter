import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  NavigationItem(this.title, this.routeName, [this.icon]);

  @override
  Widget build(BuildContext context) {
    final _active = ModalRoute.of(context).settings.name != routeName;

    void _navigateToPage() {
      Navigator.of(context).pushReplacementNamed(routeName);
    }

    if (icon == null)
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 0,
          right: 20,
        ),
        child: MaterialButton(
          onPressed: _active ? _navigateToPage : null,
          disabledColor: Theme.of(context).accentColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          disabledElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          color: Theme.of(context).accentColor,
          child: Text(
            title,
            style: Theme.of(context).accentTextTheme.headline6.apply(
                  fontSizeDelta: -2,
                ),
          ),
        ),
      );
    else
      return ListTile(
        leading: Icon(icon),
        enabled: _active,
        title: Text(title),
        onTap: _navigateToPage,
      );
  }
}
