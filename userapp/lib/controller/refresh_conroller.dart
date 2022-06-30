import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

Widget refreshController(
    {required Future<void> Function() onRefresh,
    required Widget child,
    Color? color,
    double? height}) {
  return LiquidPullToRefresh(
    showChildOpacityTransition: false,
    onRefresh: onRefresh,
    color: isColorProvided(color),
    animSpeedFactor: 5,
    height: 100,
    child: child,
  );
}

isColorProvided(Color? color) {
  if (color != null) {
    return color;
  } else {
    return Colors.deepOrange;
  }
}

isHeightProvided(double? height) {
  if (height != null) {
    return height;
  } else {
    return 100;
  }
}
