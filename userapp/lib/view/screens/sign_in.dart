import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: currentHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/icons/beu_logo_png.png"),

              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter Your phone number to signup or signin toyour account.",
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // Phone number input
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text(
                      "+251",
                      style:  TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        cursorColor: Colors.deepOrange,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(fontSize: 22),
                        decoration: const InputDecoration(
                          contentPadding:
                               EdgeInsets.only(top: 10, bottom: 10, left: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: "987123456",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 100,
              ),
              // Sign in button
              GestureDetector(
                onTap: () {
                  // show success message
                },
                child: Center(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.deepOrange,
                          Color.fromARGB(255, 255, 166, 64)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
