import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/pages/contact_page.dart';
import 'package:nieruchomosci_waw_com/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nieruchomości',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
        fontFamily: 'Open Sans',
      ),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        ContactPage.routeName: (_) => ContactPage(),
      },
    );
  }
}
