import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/view/components/verification/inputBox.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String verificationCode = "";

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;

    inputChangeHandler(newCode) {
      setState(() {
        verificationCode += newCode.text.trim();
      });
      log(verificationCode);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          padding: EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(maxWidth: 500, minWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Verify Your Code",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We have the reset password to the phone number : 0912131415",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              SizedBox(
                height: 50,
              ),
              // Verification code input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler),
                ],
              ),

              SizedBox(
                height: 80,
              ),

              // Verify button
              GestureDetector(
                onTap: () {
                  // show success message
                },
                child: Center(
                  child: Container(
                    height: 50,
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
                    child: Text(
                      "VERIFY",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Goback button
              GestureDetector(
                onTap: () {
                  // show success message
                },
                child: Center(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "BACK TO LOGIN",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              ),
              // REsend code text and link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have not received code? ",
                  ),
                  GestureDetector(
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
