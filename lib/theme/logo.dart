import 'package:flutter/material.dart';

Widget logo(Color color) {
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  Text(
            'Prm',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 60,
                fontFamily: 'Lato'),
          ),
          Text(
            'Cart',
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 60,
                fontFamily: 'Lato'),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SHOP',
            style: TextStyle(
                fontFamily: 'lato',
                color: color,
                fontSize: 22,
                letterSpacing: 20,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            ' 24/7',
            style: TextStyle(
                fontFamily: 'lato',
                color: Colors.red,
                fontSize: 22,
                letterSpacing: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
