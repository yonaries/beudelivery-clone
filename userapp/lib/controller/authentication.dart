import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:userapp/model/customer_model.dart';
import 'package:userapp/view/components/auth_screen/sign_in.dart';
import 'package:userapp/view/components/auth_screen/sign_up.dart';
import 'package:userapp/view/components/toast.dart';
import 'package:userapp/view/screens/navbar.dart';
import 'package:userapp/view/screens/verification.dart';

FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference customers =
    FirebaseFirestore.instance.collection('customers');

class SignUp {
  var context;
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
    ToastContext().init(context);
    bool isValid = await checkIfUserIsRegistered(
      phoneNumber: phoneController.text.trim(),
      context: context,
      isRegitration: true,
    );

    if (isValid) {
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
  }

  Future sendCodeToFirebase({required String smsCode}) async {
    log("Code sented to firebase");
    if (verificationId != null) {
      var credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

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

  registerUserData({required Customer customer}) async {
    await customers.add({
      'customerName': customer.customerName,
      'phoneNumber': "+251${customer.phoneNumber}",
    });
  }
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
    ToastContext().init(context);

    bool isValid = await checkIfUserIsRegistered(
      phoneNumber: phoneController.text.trim(),
      context: context,
      isRegitration: false,
    );
    if (isValid) {
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
              builder: (context) => VerificationScreen(
                sendCodeToFirebase: sendCodeToFirebase,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log("Timeout");
        },
      );
    }
  }

  Future sendCodeToFirebase({required String smsCode}) async {
    log("code sent back");
    if (verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      await auth
          .signInWithCredential(credential)
          .then((value) {})
          .whenComplete(() {
        // Navigating to the homepage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
      }).onError((error, stackTrace) {
        Navigator.pop(context);
      });
    }
  }
}

// user checker

checkIfUserIsRegistered({
  required String phoneNumber,
  required context,
  required bool isRegitration,
}) async {
  ToastContext().init(context);

  List docIds = [];
  await customers
      .limit(1)
      .where('phoneNumber', isEqualTo: "+251$phoneNumber")
      .get()
      .then(
        (snapShot) => snapShot.docs.forEach(
          (document) {
            docIds.add(document.reference.id);
          },
        ),
      );
  log(docIds.toString());
  log(docIds.isNotEmpty.toString());
  if (isRegitration == true && docIds.isNotEmpty) {
    log("doc is not empty");
    showToastMessage(
      message: "There is registered user with this phone number.",
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
    return false;
  }

  if (isRegitration == false && docIds.isEmpty) {
    log("doc is no registered user");
    showToastMessage(
      message: "There is no registered user with this phone number.",
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
    return false;
  }

  return true;
}
