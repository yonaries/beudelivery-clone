import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  const ScreenSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // current screen ratio
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Container();
  }
}
