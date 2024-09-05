import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.black,
          height: 75,
          animationDuration:const  Duration(microseconds: 300),
          items: const  [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
          ]),
    );
  }
}
