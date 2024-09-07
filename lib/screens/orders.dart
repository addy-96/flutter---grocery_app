import 'package:flutter/material.dart';
import 'package:prm_cart/theme/style.dart';
import 'package:prm_cart/widgets/appbar.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar('Orders'),
      body:  Center(
        child: Text('Oh! ... Nothing to show here',style: AppWidget().black18(),),
      ),
    );
  }
}