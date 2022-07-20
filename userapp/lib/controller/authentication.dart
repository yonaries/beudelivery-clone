import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:userapp/model/customer_model.dart';
import 'package:userapp/view/screens/navbar.dart';
import 'package:userapp/view/screens/verification.dart';

FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference customers =
    FirebaseFirestore.instance.collection('customers');

class SignUp {
  final context;
  TextEditingController phoneController;
  TextEditingController nameController;
  var verificationId;
  Function stateSetter;

  SignUp({
    required this.context,
    required this.phoneController,
    required this.nameController,
    required this.verificationId,
    required this.stateSetter,
  });

  Future registerUser() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+251${phoneController.text.trim()}',
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
        stateSetter(verificationId);
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
    log("Code sented to firebase");
    checkIfUserIsRegistered();
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
          customerName: nameController.text.trim(),
          phoneNumber: phoneController.text.trim(),
        ),
      );

      // Navigating to the homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Navbar()),
      );
    }
  }

  checkIfUserIsRegistered() {
    auth.authStateChanges().listen((User? user) {
      print("user?.uid");
      print(user?.uid);
      if (user != null) {
        print(user.uid);
      }
    });
  }

  registerUserData({required Customer customer}) async {
    await customers.add({
      'customerName': customer.customerName,
      'phoneNumber': "+251${customer.phoneNumber}",
    });
  }
}

checkIfUserIsRegistered() async {
  await auth.authStateChanges().listen((User? user) {
    print("user?.uid");
    print(user?.uid);
    if (user != null) {
      print(user.uid);
    }
  });
}

class SignIn {
  final context;
  TextEditingController phoneController;
  var verificationId;
  Function stateSetter;

  SignIn({
    required this.context,
    required this.phoneController,
    required this.verificationId,
    required this.stateSetter,
  });

  Future signInUser() async {
    await checkIfUserIsRegistered();
    await auth.verifyPhoneNumber(
      phoneNumber: '+251${phoneController.text.trim()}',
      verificationCompleted: (PhoneAuthCredential credential) async {
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
        stateSetter(verificationId);
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
    log("code sent back");
    if (verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      await auth
          .signInWithCredential(credential)
          .then((value) {})
          .whenComplete(() {})
          .onError((error, stackTrace) {});

      // Navigating to the homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Navbar()),
      );
    }
  }
}
