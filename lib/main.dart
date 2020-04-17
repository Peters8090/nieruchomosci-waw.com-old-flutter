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
        brightness: Brightness.light,
        fontFamily: 'Open Sans',
      ),
      builder: (context, child) => Theme(
        child: child,
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: MediaQuery.of(context).size.width > 1000
                    ? 1
                    : MediaQuery.of(context).size.width / 1000,
              ),
        ),
      ),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        ContactPage.routeName: (_) => ContactPage(),
      },
    );
  }
}
