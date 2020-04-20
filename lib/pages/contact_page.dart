import 'package:flutter/material.dart';
import 'package:nieruchomosci_waw_com/widgets/header/header.dart';
import 'package:nieruchomosci_waw_com/widgets/header/widgets/app_drawer.dart';
import 'package:nieruchomosci_waw_com/widgets/utility/responsive_grid.dart';

class ContactPage extends StatelessWidget {
  static const routeName = '/kontakt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      drawer: getAppDrawer(context),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
                child: Text(
                  'Kontakt',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2,
                )),
          ),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              ResponsiveGridCol(
                lower: 12,
                bigger: 6,
                child: Column(
                  children: <Widget>[
                    buildListTile(
                      context,
                      title: '+48 123 456 789',
                      icon: Icons.phone,
                    ),
                    buildListTile(
                      context,
                      title: 'biuro@nieruchomosci-waw.com',
                      icon: Icons.email,
                    ),
                    buildListTile(
                      context,
                      title: 'Numer konta: 12 1234 1234 1234 1234 1234 1234',
                      icon: Icons.attach_money,
                    ),
                  ],
                ),
              ),
              ResponsiveGridCol(
                  lower: 12,
                  bigger: 6,
                  child: Column(
                    children: <Widget>[
                      buildListTile(
                        context,
                        title: '+48 123 456 789',
                        icon: Icons.phone,
                      ),
                      buildListTile(
                        context,
                        title: 'biuro@nieruchomosci-waw.com',
                        icon: Icons.email,
                      ),
                      buildListTile(
                        context,
                        title: 'Numer konta: 12 1234 1234 1234 1234 1234 1234',
                        icon: Icons.attach_money,
                      ),
                    ],
                  ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context, {String title, IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Card(
        child: ListTile(
          leading: Icon(
            icon,
            size: 35,
          ),
          title: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ),
        ),
      ),
    );
  }
}
