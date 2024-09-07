import 'package:flutter/material.dart';
import 'package:prm_cart/screens/home.dart';

void main() {
  runApp(
    const MaterialApp(
      home: PrmCart(),
    ),
  );
}

class PrmCart extends StatelessWidget {
  const PrmCart({super.key});
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
