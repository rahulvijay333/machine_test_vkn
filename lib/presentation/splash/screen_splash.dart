import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/application/auth/auth_bloc.dart';
import 'package:login_machine_test/presentation/home/screen_home.dart';
import 'package:login_machine_test/presentation/login/scree_login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({
    super.key,
  });

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      BlocProvider.of<AuthBloc>(context).add(AuthStatus());
      final authBloc = BlocProvider.of<AuthBloc>(context);
      authBloc.stream.listen((state) {
        if (state is AuthVerified) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ScreenHome()));
        } else if (state is AuthNotVeriied) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ScreenLogin()));
        }
      });
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:  BoxDecoration(
            color: Colors.blue.shade300,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vikn App',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
