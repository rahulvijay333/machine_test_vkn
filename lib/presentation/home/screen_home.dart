import 'package:flutter/material.dart';
import 'package:login_machine_test/presentation/sales/sales_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vikn Account'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const ScreenSalesEstimate();
          },));
        }, child: const Text('check sales')),
      ),
    );
  }
}
