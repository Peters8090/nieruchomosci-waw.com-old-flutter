import 'package:flutter/material.dart';

import '../../pages/contact_page.dart';
import '../../pages/home_page.dart';
import '../../widgets/header/widgets/navigation_item.dart';
import '../../widgets/logo.dart';
import '../../widgets/utility/constants.dart';

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
      actions: MediaQuery.of(context).size.width > mobileBreakpoint
          ? [
              NavigationItem('Home', HomePage.routeName),
              NavigationItem('Kontakt', ContactPage.routeName),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
