import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prm_cart/screens/home.dart';
import 'package:prm_cart/screens/profile.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<Widget> screens = const [Home(), Profile()];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) {
            log(value.toString());
            setState(() {
              currentIndex=value;
            });
          },
          backgroundColor: Colors.white,
          color: Colors.black,
          height: 75,
          animationDuration: const Duration(microseconds: 300),
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ]),
    );
  }
}
