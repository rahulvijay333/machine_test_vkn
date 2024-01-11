import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_machine_test/application/login/login_bloc.dart';

import 'package:login_machine_test/presentation/home/screen_home.dart';
import 'package:login_machine_test/presentation/home/widget/screen_linear_backg.dart';
import 'package:login_machine_test/presentation/login/widgets/create_account.dart';
import 'package:login_machine_test/presentation/login/widgets/translate_container.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwdController = TextEditingController();

  bool _hidePasswprd = true;

  @override
  void dispose() {
    _passwdController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const adjustSize = Size.fromHeight(60);

    return Scaffold(
      body: Stack(
        children: [
          const ScreenAnimatedLinearBg(),
          Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: adjustSize.height,
                bottom: adjustSize.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TrainslateContainer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Login to your vikn account',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color:
                                  Colors.grey), // Change the border color here
                          color: Colors.white,
                        ),
                        // color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, top: 8),
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    filled: true,
                                    focusColor: null,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(
                                      CupertinoIcons.person,
                                      color: Colors.blue,
                                    ),
                                    fillColor: Colors.white,
                                    label: Text('Username'),
                                    labelStyle: TextStyle(
                                        fontSize: 18,
                                        height: 1.3,
                                        color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            const Divider(
                              height: 0,
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, top: 8),
                              child: TextFormField(
                                controller: _passwdController,
                                obscureText: _hidePasswprd,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    filled: true,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Transform.rotate(
                                      angle: 130 * 3.14 / 180,
                                      child: Transform.flip(
                                        flipY: true,
                                        child: const Icon(
                                          Icons.key,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _hidePasswprd == true
                                                ? _hidePasswprd = false
                                                : _hidePasswprd = true;
                                          });
                                        },
                                        icon: _hidePasswprd == true
                                            ? const Icon(
                                                Icons.visibility_off_outlined,
                                                color: Colors.blue,
                                              )
                                            : const Icon(
                                                Icons.visibility_outlined,
                                                color: Colors.blue,
                                              )),
                                    fillColor: Colors.white,
                                    label: const Text('Password'),
                                    labelStyle: const TextStyle(
                                        fontSize: 18,
                                        height: 1.3,
                                        color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Forgotten Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //-------------------------------login actions
                    GestureDetector(
                      onTap: () {
                        if (_passwdController.text.isNotEmpty &&
                            _usernameController.text.isNotEmpty) {
                          BlocProvider.of<LoginBloc>(context).add(LogIn(
                              username: _usernameController.text,
                              password: _passwdController.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('check login credentials')));
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.errorMessage)));
                            } else if (state is LoginSuccess) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('Login success')));

                              Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return const ScreenHome();
                                    },
                                  ));
                                },
                              );
                            }
                          },
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Container(
                                height: 40,
                                width: size.width * 0.27,
                                color: Colors.blue,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Sign in',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      state is LoginLoading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 1,
                                              ))
                                          : const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //-------container 3
                const CreateAccountOptionContainer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
