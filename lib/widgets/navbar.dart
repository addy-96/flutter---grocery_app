import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:prm_cart/screens/Categories.dart';
import 'package:prm_cart/screens/Search.dart';
import 'package:prm_cart/screens/basket.dart';
import 'package:prm_cart/screens/home.dart';
import 'package:prm_cart/screens/orders.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> screens = const [
    Home(),
    Categories(),
    Search(),
    Orders(),
    Basket()
  ];

  TextStyle navtextstyle() => const TextStyle(
        fontFamily: 'Lato',
        fontSize: 12,
      );

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      context,
      controller: _controller,
      screens: screens,
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          inactiveColorPrimary: Colors.black38,
          title: 'Home',
          activeColorPrimary: Colors.green,
          textStyle: navtextstyle(),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.grid_view),
          inactiveColorPrimary: Colors.black38,
          title: 'Categories',
          activeColorPrimary: Colors.green,
          textStyle: navtextstyle(),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.search,
              color: Colors.black45,
            ),
          ),
          inactiveColorPrimary: Colors.black38,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add_shopping_cart_outlined),
          inactiveColorPrimary: Colors.black38,
          title: 'Orders',
          activeColorPrimary: Colors.green,
          textStyle: navtextstyle(),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_bag_outlined),
          inactiveColorPrimary: Colors.black38,
          title: 'Basket',
          activeColorPrimary: Colors.green,
          textStyle: navtextstyle(),
        ),
      ],
      navBarStyle: NavBarStyle.style15,
    );
  }
}
