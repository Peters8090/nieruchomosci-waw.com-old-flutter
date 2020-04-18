import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/pages/contact_page.dart';
import 'package:nieruchomosci_waw_com/pages/home_page.dart';
import 'package:nieruchomosci_waw_com/widgets/header/widgets/navigation_item.dart';
import 'package:nieruchomosci_waw_com/widgets/logo.dart';
import 'package:nieruchomosci_waw_com/widgets/utility/constants.dart';

dynamic getAppDrawer(BuildContext context) {
  return MediaQuery.of(context).size.width < mobileBreakpoint
      ? AppDrawer()
      : null;
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Logo(Theme.of(context).accentTextTheme.headline5),
            ),
          ),
          NavigationItem('Home', HomePage.routeName, Icons.home),
          NavigationItem('Kontakt', ContactPage.routeName, Icons.contacts),
        ],
      ),
    );
  }
}
