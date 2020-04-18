import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final TextStyle style;

  Logo([this.style]);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      'Nieruchomości Warszawa',
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
