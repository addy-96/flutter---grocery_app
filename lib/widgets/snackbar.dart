import 'package:flutter/material.dart';
import 'package:prm_cart/theme/style.dart';

getSnackbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message,style: AppWidget().textStyle(15,Colors.black),),
      backgroundColor: color,
      elevation: 5, 
    ),
  );
}
