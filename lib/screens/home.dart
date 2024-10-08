import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prm_cart/screens/profile.dart';
import 'package:prm_cart/services/firebase_store.dart';
import 'package:prm_cart/theme/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _store = StoreServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(248, 213, 255, 144).withOpacity(0.3),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  'prm ',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Lato',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Profile(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person_outline,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                locationbar(),
                const SizedBox(height: 5),
                searchbar(),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  staticBannerthin(),
                  const SizedBox(height: 5),
                  festivalcontainer(),
                  const SizedBox(height: 5),
                  sideScrollView(),
                  const SizedBox(height: 5),
                  GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: banner()),
                  const SizedBox(height: 5),
                  orderAgainStack(),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget staticBannerthin() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          'assets/images/staticBanner.png',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget festivalcontainer() {
  return const Padding(
    padding: EdgeInsets.only(top: 20, bottom: 20, left: 5),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Happy Ganesh Chaturthi',
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Happy Ganesh Chaturthi',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget locationbar() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color.fromARGB(248, 213, 255, 144).withOpacity(0.1),
          const Color.fromARGB(248, 213, 255, 144).withOpacity(0.5),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(248, 227, 252, 186).withOpacity(0.1),
                  const Color.fromARGB(248, 213, 255, 144).withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              border: const Border.symmetric(
                horizontal: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 211, 241, 211)),
              ),
            ),
            child: const Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: Color.fromARGB(255, 36, 83, 37),
                    ),
                    Text(
                      'Selected Location - ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 83, 37),
                        fontFamily: 'Lato',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mumbai , 400001',
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 83, 37),
                        fontFamily: 'Lato',
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color.fromARGB(255, 36, 83, 37),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget searchbar() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: Colors.black26.withOpacity(0.2))),
    width: double.infinity,
    child: const Padding(
      padding: EdgeInsets.all(2.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black38,
            size: 20,
          ),
          suffixIcon: Icon(
            Icons.mic,
            color: Colors.black38,
            size: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget banner() {
  int randomNumber = Random().nextInt(7) + 1;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 180,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.asset(
          'assets/images/banner$randomNumber.jpg',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

Widget orderAgainStack() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple.withOpacity(0.1),
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Discounted',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 70,
        left: 0,
        right: 0,
        child: SizedBox(
          height: 270, // Match the height of the `Material` containers
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                    borderOnForeground: true,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 310,
                      width: 150,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 105,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black12,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Image.asset(
                                    'assets/images/example1.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 70, 146, 72),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.elliptical(15, 15),
                                  bottomRight: Radius.elliptical(15, 15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Text(
                                  '50% OFF',
                                  style: AppWidget().textStyle(
                                    14,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // Example color
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget sideScrollView() {
  int val = 1;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(6, (index) {
        val = index + 2;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(30, 30),
                topRight: Radius.elliptical(
                  30,
                  30,
                ),
              ),
              child: Image.asset(
                'assets/images/sidescroll$val.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }),
    ),
  );
}

// error in this part to be resolved later
Widget shopByCategory() {
  return Column(
    children: [
      const Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Row(
          children: [
            Text(
              'Shop by Category ',
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Container(
        height: 600,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: List.generate(
            20,
            (index) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.grey,
                height: 100,
                width: 150,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
