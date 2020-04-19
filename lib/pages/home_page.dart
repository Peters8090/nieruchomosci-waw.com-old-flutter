import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/widgets/header/widgets/app_drawer.dart';
import 'package:nieruchomosci_waw_com/widgets/utility/responsive_text_theme.dart';
import 'package:nieruchomosci_waw_com/widgets/header/header.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(true),
      extendBodyBehindAppBar: true,
      drawer: getAppDrawer(context),
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
            child: ResponsiveTextTheme(
              builder: (ctx) => Column(
                children: <Widget>[
                  Text(
                    'Twoje wymarzone nieruchomości',
                    style: Theme.of(ctx).accentTextTheme.headline1,
                  ),
                  Text(
                    'w jednym miejscu',
                    style: Theme.of(ctx)
                        .textTheme
                        .headline2
                        .apply(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
