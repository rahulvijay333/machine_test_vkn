import 'package:flutter/material.dart';

class ScreenAnimatedLinearBg extends StatelessWidget {
  const ScreenAnimatedLinearBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            Colors.blue.shade100.withOpacity(0.2),
            Colors.white,
          ])),
    );
  }
}
