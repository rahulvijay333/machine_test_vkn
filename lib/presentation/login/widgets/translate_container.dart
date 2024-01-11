import 'package:flutter/material.dart';

class TrainslateContainer extends StatelessWidget {
  const TrainslateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Row(
          children: [
            Icon(
              Icons.translate,
              color: Colors.blue,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'English',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}
