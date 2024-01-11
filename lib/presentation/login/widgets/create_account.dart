import 'package:flutter/material.dart';

class CreateAccountOptionContainer extends StatelessWidget {
  const CreateAccountOptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Dont have an Account?',
            style: TextStyle(fontWeight: FontWeight.w400)),
        SizedBox(
          height: 10,
        ),
        Text(
          'Sign up now!',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
