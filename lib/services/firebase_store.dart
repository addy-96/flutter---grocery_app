import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreServices {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  onSignUp(String uid, Map<String, dynamic> data) async {
    try {
      await _store.collection('users').doc(uid).set(data);
    } catch (err) {
      log(err.toString());
    }
  }

  getData() async {
    User? user = _auth.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    final response = await _store.collection('users').doc(userId).get();

    for (var entry in response.data()!.entries) {
      log('${entry.key} : ${entry.value}');
    }
  }
}
