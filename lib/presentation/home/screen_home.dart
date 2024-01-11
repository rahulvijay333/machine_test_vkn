import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/application/logout/logout_bloc.dart';
import 'package:login_machine_test/application/sales_estimate/sales_estimate_bloc.dart';
import 'package:login_machine_test/presentation/login/scree_login.dart';
import 'package:login_machine_test/presentation/sales/sales_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vikn Account',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('Do you want to log out ?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<LogoutBloc>(context)
                                  .add(Logout());
                              Navigator.of(context).pop();
                            },
                            child: const Text('yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('no'))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.blue,
              ))
        ],
      ),
      //--------logout button bloc listoner--
      body: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Loggin out from account...')));
          } else if (state is LogoutSuccess) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return const ScreenLogin();
              },
            ));
          } else if (state is Logoutfailed) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 2),
                content: Text('Logout failed..')));
          }
        },
        child: Center(
          // button that lets user to got sale estimate screen
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<SalesEstimateBloc>(context)
                    .add(GetSalesEstimate());
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ScreenSalesEstimate();
                  },
                ));
              },
              child: const Text('check sales')),
        ),
      ),
    );
  }
}
