import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;

  NavigationItem(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final active = ModalRoute.of(context).settings.name == routeName;

    return Container(
      margin: EdgeInsets.all(10).subtract(EdgeInsets.only(left: 5)),
      child: MaterialButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(routeName),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: active ? Theme.of(context).primaryColorDark : Theme.of(context).accentColor,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6.apply(
                color: Colors.white,
                fontSizeDelta: -2,
              ),
        ),
      ),
    );
  }
}
