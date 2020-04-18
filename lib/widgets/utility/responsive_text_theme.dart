import 'package:flutter/material.dart';
import 'constants.dart';

class ResponsiveTextTheme extends StatelessWidget {
  final Function builder;

  ResponsiveTextTheme({this.builder});

  @override
  Widget build(BuildContext context) {
    final modifiedFontSizeFactor = MediaQuery.of(context).size.width > mobileBreakpoint
        ? 1
        : MediaQuery.of(context).size.width / mobileBreakpoint;
    
    return Theme(
      child: Child(builder),
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: modifiedFontSizeFactor,
            ),
        accentTextTheme: Theme.of(context).accentTextTheme.apply(
              fontSizeFactor: modifiedFontSizeFactor,
            ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  final Function builder;

  Child(this.builder);

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}