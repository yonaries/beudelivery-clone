import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/images/beu_logo_with_text.png",
            height: 250.0,
          ),
          SizedBox(
            height: 70.0,
          ),
          SpinKitRing(
            color: Theme.of(context).colorScheme.secondary,
            size: 50.0,
            lineWidth: 4.0,
          ),
        ],
      ),
    );
  }
}
