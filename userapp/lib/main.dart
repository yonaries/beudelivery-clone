import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/screens/navbar.dart';
import 'package:userapp/screens/onboarding.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme,
        ),
        primaryColor: Colors.white,
        colorScheme: const ColorScheme(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(250, 74, 12, 1),
          onSecondary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          error: Color.fromRGBO(255, 43, 43, 1),
          onError: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      home: const Navbar(),
    );
  }
}
