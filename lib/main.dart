import 'package:flutter/material.dart';

import 'pages/contact_page.dart';
import 'pages/home_page.dart';

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
