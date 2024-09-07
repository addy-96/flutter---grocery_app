import 'package:flutter/material.dart';
import 'package:prm_cart/widgets/appbar.dart';

class Basket extends StatelessWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Basket'),
    );
  }
}