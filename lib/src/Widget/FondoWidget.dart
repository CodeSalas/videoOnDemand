  import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(181, 81, 98, 1.0),
        Color.fromRGBO(59, 35, 68, 1.0)
      ], begin: Alignment.topCenter)),
      width: double.infinity,
      height: double.infinity,
    );
  }
}