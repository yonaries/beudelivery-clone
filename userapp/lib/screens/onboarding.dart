import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/onboarding_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(250, 74, 12, 1).withOpacity(0.5),
                  BlendMode.darken),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(250, 74, 12, 0.65),
                  Color.fromRGBO(250, 74, 12, 0.95),
                  Color.fromRGBO(250, 74, 12, 1),
                ],
              ),
            ),

            // /////////
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Always\nOn time",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        "Get Your meals delivered Fresh, Hot and Ready to eat whenever you need it.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                            height: 70,
                            minWidth: 290,
                            textColor: Colors.deepOrange[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}