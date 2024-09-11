import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prm_cart/services/auth_services.dart';
import 'package:prm_cart/services/local_store_services.dart';
import 'package:prm_cart/theme/style.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = AuthServices();
  final _pref = LocalStoreServices();

  Future<Map<String, String?>> _getUserData() async {
    final username = await _pref.getUserDetails('username');
    final email = await _pref.getUserDetails('email');
    return {'username': username, 'email': email};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Account',
          style: AppWidget().appbartext(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<Map<String, String?>>(
              future: _getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No data found'));
                } else {
                  final userData = snapshot.data!;
                  return userPersonalInfo(
                      context, userData['username'], userData['email']);
                }
              },
            ),
            infoSection('Orders', const Icon(Icons.shopping_bag_outlined)),
            infoSection('Addresses', const Icon(Icons.location_on_outlined)),
            infoSection(
                'Wallet', const Icon(Icons.account_balance_wallet_outlined)),
            infoSection('Rating & Review', const Icon(Icons.reviews_outlined)),
            infoSection('Support', const Icon(Icons.support_agent_outlined)),
            appOptions('FAQs'),
            appOptions('Terms & Condition'),
            appOptions('Privacy Policy'),
            GestureDetector(
              child: appOptions('Logout'),
              onTap: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  log(user.uid);
                }
                log('logout tapped');
                await _auth.onSignOut(context);
                if (user == null) {
                  log('no user found');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget userPersonalInfo(
      BuildContext context, String? username, String? email) {
    return Container(
      color: const Color.fromARGB(255, 245, 116, 135),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(158, 111, 175, 7),
                        Color.fromARGB(185, 16, 187, 104),
                      ],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Icon(
                        Icons.person_4_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  username ?? 'Username',
                                  style:
                                      AppWidget().textStyle(24, Colors.white),
                                ),
                                const Icon(
                                  Icons.edit_outlined,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Text(
                              email ?? 'Email',
                              style: AppWidget().textStyle(18, Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 35,
                          color: Color.fromARGB(255, 245, 116, 135),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Krishna Pura',
                                  style: AppWidget().textStyle(
                                    15,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  'Ranchi - 835217',
                                  style: AppWidget().textStyle(
                                    15,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'Change',
                            style: AppWidget().textStyle(15, Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoSection(String title, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 0.2,
            color: Colors.black12.withOpacity(0.1),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.lime.shade400.withOpacity(0.5),
              child: icon,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: AppWidget().profileOptionBarText(),
            ),
          ],
        ),
      ),
    );
  }

  Widget appOptions(String title) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: AppWidget().profileAppOptions(),
      ),
    );
  }
}
