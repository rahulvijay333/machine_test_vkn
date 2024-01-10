import 'package:flutter/material.dart';

class CustomLinearColorDivider extends StatelessWidget {
  const CustomLinearColorDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.withOpacity(0.3), Colors.white],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}


class CustomLinearDiv extends StatelessWidget {
  const CustomLinearDiv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CustomLinearColorDivider(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}