import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBox extends StatefulWidget {
  // final List<String> verificationCode;
  final Function inputChangeHandler;
  final int id;
  const InputBox({
    Key? key,
    required this.inputChangeHandler,
    required this.id,
  }) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final _verificationNumberController = TextEditingController();
  bool isChanged = false;
  @override
  void dispose() {
    _verificationNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        controller: _verificationNumberController,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
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
              widget.inputChangeHandler(_verificationNumberController, widget.id);
            });
          }
        },
        style: TextStyle(
          fontSize: 20,
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
