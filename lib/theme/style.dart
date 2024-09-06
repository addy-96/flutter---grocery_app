import 'package:flutter/material.dart';

class AppWidget {
  TextStyle green32() =>
      const TextStyle(color: Colors.green, fontSize: 25, fontFamily: 'Lato');
  TextStyle black18() => const TextStyle(
        fontSize: 18,
        fontFamily: 'Lato',
      );
  TextStyle buttonText(Color color) => TextStyle(
        fontSize: 18,
        fontFamily: 'Lato',
        color: color,
        fontWeight: FontWeight.bold,
      );
}
