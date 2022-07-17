import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/view/components/verification/input_box.dart';

class VerificationScreen extends StatefulWidget {
  final Function sendCodeToFirebase;
  const VerificationScreen({Key? key, required this.sendCodeToFirebase}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List verificationCode = [];

  @override
  Widget build(BuildContext context) {

    inputChangeHandler(newCode, id) {
      bool isEmpty = true;
      setState(() {
        verificationCode[id] = newCode.text.trim();
      });

      for (int i = 0; i < 6; i++) {
        if (verificationCode[i].isEmpty) {
          break;
        } else {
          isEmpty = true;
        }
      }
      log("$verificationCode // ${verificationCode.length}");

      if (isEmpty == true) {
        widget.sendCodeToFirebase(smsCode: verificationCode);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Verify Your Code",
                style:  TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We have the reset password to the phone number : 0912131415",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              // Verification code input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler,
                      id: 01),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler,
                      id: 1),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler,
                      id: 2),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler,
                      id: 3),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler,
                      id: 4),
                  InputBox(
                      verificationCode: verificationCode,
                      inputChangeHandler: inputChangeHandler,
                      id: 5),
                ],
              ),

              const SizedBox(
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
                    child: const Text(
                      "VERIFY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Goback button
              GestureDetector(
                onTap: () {
                  // show success message
                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "BACK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
              // REsend code text and link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You have not received code? ",
                  ),
                  GestureDetector(
                    child: const Text(
                      "Resend",
                      style:  TextStyle(
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
