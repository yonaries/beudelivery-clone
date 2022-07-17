import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/view/screens/navbar.dart';
import 'package:userapp/model/customer_model.dart';
import 'package:userapp/view/screens/verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var verificationId;

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future registerUser() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+251${_phoneController.text.trim()}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        log("completed");
        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          log('The provided phone number is not valid.');
        }
        log("Error started");
        log(e.toString());
        log("Error finished");
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          this.verificationId = verificationId;
        });
        // Update the UI - wait for the user to enter the SMS code
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VerificationScreen(sendCodeToFirebase: sendCodeToFirebase),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        log("Timeout");
      },
    );
  }

  Future sendCodeToFirebase({required String smsCode}) async {
    if (verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      await auth
          .signInWithCredential(credential)
          .then((value) {})
          .whenComplete(() {})
          .onError((error, stackTrace) {});

      // Registering user data to firestore
      registerUserData(
        customer: Customer(
          customerName: _nameController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
        ),
      );

      // Navigating to the homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Navbar()),
      );
    }
  }

  registerUserData({required Customer customer}) async {
    CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');
    await customers.add({
      'customerName': customer.customerName,
      'phoneNumber': "+251${customer.phoneNumber}",
    });
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
                "Sign Up",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter Your phone number to signup",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // name textfield
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Full Name",
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Phone",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                          style: TextStyle(
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
                            maxLength: 9,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(9),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: const TextStyle(fontSize: 22),
                            decoration: const InputDecoration(
                              counterText: "",
                              contentPadding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 20),
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
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              // Sign in button
              GestureDetector(
                onTap: () {
                  // show success message
                  registerUser();
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
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // it user is already signed up
              // Row(
              //   children: [],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
