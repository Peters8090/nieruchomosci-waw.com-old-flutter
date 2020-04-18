import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/widgets/header/header.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(true),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://bi.im-g.pl/im/2b/be/17/z24897067V,Wiezowiec-Warsaw-Spimmmmmre-na-Woli.jpg',
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.blueGrey.withOpacity(0.8),
                  Colors.black87,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10,
              vertical: MediaQuery.of(context).size.height / 10,
            ),
            child: Column(
              children: <Widget>[
                SelectableText(
                  'Twoje wymarzone nieruchomości',
                  maxLines: 2,
                  style: Theme.of(context).accentTextTheme.headline1,
                ),
                SelectableText(
                  'w jednym miejscu',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .apply(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}