import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

cardProvider({required Image providerImage}) {
  return Container(
    height: 30,
    margin: const EdgeInsets.only(right: 5),
    child: providerImage,
  );
}
