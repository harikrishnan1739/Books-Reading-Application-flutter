import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isdatamatched = true;

  final _formkey = GlobalKey<FormState>();

  final name = "hari";
  final password = "hari";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Bitmap.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Icon(
                    Icons.menu_book,
                    size: 100,
                  ),
                  //Welcom page
                  const Text(
                    "HELLO AGAIN!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome back, you've been missed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Username text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  hintText: 'Username',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                                validator: (_username) {
                                  if (_username == null ||_username.isEmpty) {
                                    return 'Please Enter the Username';
                                  } else if (_username == name) {
                                    print('name1');
                                    return null;
                                  } else if(_username != name){
                                    print('name');
                                    return "username doest't matched";
                                  }
                                }
                                ),
                                
                            const SizedBox(
                              height: 10,
                            ),
                            // password text field
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                obscureText: true,
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    hintText: 'Password',
                                    prefixIcon: const Icon(
                                      Icons.key,
                                      color: Colors.black,
                                    )),
                                validator: (_password) {
                                  if (_password == null || _password.isEmpty) {
                                    return 'Please Enter the password';
                                  } else if (_password == password) {
                                    return null;
                                  }else if(_password != password){
                                    return  'Passdword doesnot match';
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //singn in button
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ChecKlogin(context);
                          }
                          ChecKlogin(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Login'),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 13,
                  ),

                  //not a membet? Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 119, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void ChecKlogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == name && _password == password) {
      print("Username Password match");

      // Go to Home
      final _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Screenhome()));
    } else if (_username != name &&_password != password &&_username.isNotEmpty &&_password.isNotEmpty) {
      print("Username Password doesnot match");
      final _errorMessage = "Username  Password does't Matched!";

      // Allert button
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(_errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('close'),
                ),
              ],
            );
          });

      // Show Text
      setState(() {
        _isdatamatched = false;
      });
    }
  }
}
