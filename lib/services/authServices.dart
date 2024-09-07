import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prm_cart/widgets/snackbar.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  onSignUp(BuildContext context, String email, String password, String username) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        return;
      }
      log('User with email $email created , userID is ${response.user!.uid}');
      getSnackbar(context, 'Welcome $username', Colors.green);
    } on FirebaseAuthException catch (err) {
      log(err.message.toString());
      getSnackbar(context, err.message ?? 'Authentication Filed', Colors.red);
    }
  }

  onLogin(BuildContext context, String email, String password) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          getSnackbar(context, 'Welcome Back !', Colors.green);
      if (response.user == null) {
        return;
      }
      log('User signed in with $email with ${response.user!.uid}');

    } on FirebaseAuthException catch (err) {
      log(err.message.toString());
      getSnackbar(context, err.message ?? 'Authentication Filed', Colors.red);
    }
  }
}
