import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_machine_test/core/common/liner_divider.dart';
import 'package:login_machine_test/presentation/sales/widgets/sales_estimate_item.dart';

class ScreenSalesEstimate extends StatelessWidget {
  const ScreenSalesEstimate({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
        title: const Text(
          'Sales Estimate',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.add,
                color: Colors.blue,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: TextStyle(
                        fontSize: 18, color: Colors.grey.withOpacity(0.6)),
                  ),
                  const Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            const CustomLinearColorDivider(),
            //----------show sales estimate data
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return SalesEstimateItem(size: size);
                  },
                  separatorBuilder: (context, index) {
                    return const CustomLinearDiv();
                  },
                  itemCount: 5),
            ))
          ],
        ),
      ),
    );
  }
}
