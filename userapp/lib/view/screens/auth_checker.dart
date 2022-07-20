import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:userapp/controller/authentication.dart';
import 'package:userapp/view/components/auth_screen/sign_up.dart';
import 'package:userapp/view/screens/navbar.dart';
import 'package:userapp/view/components/auth_screen/sign_in.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Already signed in
            return const Navbar();
          } else {
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}
