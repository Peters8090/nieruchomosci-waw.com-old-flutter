import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/widgets/header/header.dart';
import 'package:nieruchomosci_waw_com/widgets/header/widgets/app_drawer.dart';

class ContactPage extends StatelessWidget {
  static const routeName = '/kontakt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      drawer: getAppDrawer(context),
      body: Center(
        child: Text('Kontakt'),
      ),
    );
  }
}
