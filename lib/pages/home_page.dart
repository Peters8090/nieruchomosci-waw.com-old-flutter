import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/widgets/header/header.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: Header(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height - Header.height,
                child: Image.network(
                  'https://ak4.picdn.net/shutterstock/videos/14040194/thumb/1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width / 10,
                  vertical: mediaQuery.size.height / 10,
                ),
                child: SelectableText(
                  'Lorem ipsum',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
          Text('fdsuhsdfsdf')
        ],
      ),
    );
  }
}
