import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/widgets/header/header.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(child: Text('Home')),
    );
  }
}
