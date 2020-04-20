import 'package:flutter/material.dart';

import '../../../pages/contact_page.dart';
import '../../../pages/home_page.dart';
import '../../../widgets/header/widgets/navigation_item.dart';
import '../../../widgets/logo.dart';
import '../../../widgets/utility/constants.dart';

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
