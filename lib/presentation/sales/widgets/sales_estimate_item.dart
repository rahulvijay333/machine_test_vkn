import 'package:flutter/material.dart';

class SalesEstimateItem extends StatelessWidget {
  const SalesEstimateItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints:
                BoxConstraints(maxWidth: size.width * 0.6),
            // color: Colors.amber,
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '#invoice No',
                  style: TextStyle(
                      fontSize: size.width > 400
                          ? 18
                          : size.width * 0.035),
                ),
                Text(
                  'Customer name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: size.width > 400
                          ? 20
                          : size.width * 0.04,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Container(
            constraints:
                BoxConstraints(maxWidth: size.width * 0.30),
            // color: Colors.blue,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('invoiced',
                    style: TextStyle(
                        fontSize: size.width > 400
                            ? 18
                            : size.width * 0.036)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'SAR.',
                      style: TextStyle(color: Colors.grey,
                          fontSize: size.width > 400
                              ? 15
                              : size.width * 0.030),
                    ),
                    Text('10,000.00',
                        style: TextStyle(
                            fontSize: size.width > 400
                                ? 18
                                : size.width * 0.036))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
