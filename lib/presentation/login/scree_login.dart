import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_machine_test/presentation/home/screen_home.dart';
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const adjustSize = Size.fromHeight(60);
    log(size.width.toString());

    return Scaffold(
      body: Padding(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                          color: Colors.grey), // Change the border color here
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
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.blue,
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
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return const ScreenHome();
                      },));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 40,
                        width: size.width * 0.27,
                        color: Colors.blue,
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
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
    );
  }
}


