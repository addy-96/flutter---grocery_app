import 'package:flutter/material.dart';
import 'package:prm_cart/screens/auth/auth.dart';
import 'package:prm_cart/theme/style.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Auth(
                    authType: 'login',
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          'Admin Pannel',
          style: AppWidget().textStyle(
            30,
            Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              adminOptions('+ Add Items ', context),
            ],
          ),
        ],
      ),
    );
  }
}

Widget adminOptions(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRect(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/grocerryAdmin.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
