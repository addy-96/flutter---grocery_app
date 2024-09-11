import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prm_cart/firebase_options.dart';
import 'package:prm_cart/screens/auth/auth.dart';
import 'package:prm_cart/widgets/navbar.dart';

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
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Something Went wrong ! '),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.refresh),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Retry'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return Auth(authType: 'login');
          } else {
            return BottomNav();
          }
        });
  }
}
