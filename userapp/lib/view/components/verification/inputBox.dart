import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBox extends StatefulWidget {
  String verificationCode;
  Function inputChangeHandler;
  InputBox(
      {Key? key,
      required this.verificationCode,
      required this.inputChangeHandler})
      : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final _verificationNumberController = TextEditingController();
  bool isChanged = false;
  bool isEnabled = true;

  checkCode() {
    if (widget.verificationCode.length == 4) {
      setState(() {
        isEnabled = false;
      });
    }
  }

  @override
  void dispose() {
    _verificationNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: TextField(
        controller: _verificationNumberController,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        onChanged: (v) {
          if (_verificationNumberController.text.length == 1) {
            FocusScope.of(context).nextFocus();
            setState(() {
              isChanged = true;
              widget.inputChangeHandler(_verificationNumberController);
            });
          }
          if (widget.verificationCode.length == 3) {
            log("Done");
          }
        },
        style: TextStyle(
          fontSize: 30,
          color: isChanged ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          filled: isChanged,
          fillColor: Colors.deepOrange,
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.deepOrange,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.deepOrange,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
