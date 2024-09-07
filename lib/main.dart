import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prm_cart/firebase_options.dart';
import 'package:prm_cart/screens/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      home: PrmCart(),
    ),
  );
}

class PrmCart extends StatelessWidget {
  const PrmCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Auth(authType: 'login');
  }
}
