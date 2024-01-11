import 'package:flutter/material.dart';

class SalesEstimateItem extends StatelessWidget {
  const SalesEstimateItem({
    super.key,
    required this.size,
    required this.customerName,
    required this.invoice,
    required this.invStatus,
    required this.totalAmy,
  });

  final Size size;
  final String customerName;
  final String invoice;
  final String invStatus;
  final String totalAmy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: size.width * 0.6),
            // color: Colors.amber,
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '#',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width > 400 ? 18 : size.width * 0.035),
                    ),
                    Text(
                      invoice.replaceAll('*-', ''),
                      style: TextStyle(
                          fontSize: size.width > 400 ? 15 : size.width * 0.034),
                    ),
                  ],
                ),
                //--------name
                Text(
                  customerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: size.width > 400 ? 18 : size.width * 0.039,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: size.width * 0.30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(invStatus,
                    style: TextStyle(
                        fontSize: size.width > 400 ? 18 : size.width * 0.037)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'SAR.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width > 400 ? 15 : size.width * 0.030),
                    ),
                    Text(totalAmy,
                        style: TextStyle(
                            fontSize:
                                size.width > 400 ? 18 : size.width * 0.040))
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
