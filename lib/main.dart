import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/application/auth/auth_bloc.dart';
import 'package:login_machine_test/application/login/login_bloc.dart';
import 'package:login_machine_test/application/logout/logout_bloc.dart';
import 'package:login_machine_test/application/sales_estimate/sales_estimate_bloc.dart';
import 'package:login_machine_test/domain/db/token_storage/secure_storage.dart';
import 'package:login_machine_test/infrastructure/login/login_service.dart';
import 'package:login_machine_test/infrastructure/sales_estimate/sales_service.dart';

import 'package:login_machine_test/presentation/splash/screen_splash.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginService loginService = LoginService();
    final SecureStorageService secureStorageService = SecureStorageService();
    final SalesService salesService = SalesService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(loginService, secureStorageService),
        ),
        BlocProvider(
          create: (context) => AuthBloc(secureStorageService),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(secureStorageService),
        ),
        BlocProvider(
          create: (context) =>
              SalesEstimateBloc(salesService, secureStorageService),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}
