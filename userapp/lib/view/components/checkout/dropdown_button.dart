import 'package:flutter/material.dart';

Container dropdownButton({
  required String countryValue,
  required List<String> countryList,
  required dropdownChangeHandler,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(50),
    ),
    child: DropdownButton<String>(
      iconEnabledColor: Colors.deepOrange,
      iconSize: 40,
      underline: Container(
        height: 0,
        color: Colors.deepPurpleAccent,
      ),
      isExpanded: true,
      elevation: 1,
      hint: const Text("Choose your country"),
      value: countryValue.isNotEmpty ? countryValue : null,
      onChanged: dropdownChangeHandler,
      items: countryList.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(
            country,
            style: const TextStyle(color: Colors.grey),
          ),
        );
      }).toList(),
    ),
  );
}
