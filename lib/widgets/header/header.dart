import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/pages/contact_page.dart';
import 'package:nieruchomosci_waw_com/pages/home_page.dart';
import 'package:nieruchomosci_waw_com/widgets/header/widgets/navigation_item.dart';
import 'package:nieruchomosci_waw_com/widgets/logo.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  static const height = kToolbarHeight;

  final bool transparent;

  Header([this.transparent = false]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Logo(),
      backgroundColor: transparent ? Colors.transparent : null,
      elevation: transparent ? 0 : null,
      actions: <Widget>[
        NavigationItem('Home', HomePage.routeName),
        NavigationItem('Kontakt', ContactPage.routeName),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}