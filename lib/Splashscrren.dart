import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
      checkUserloggedIn();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashsreen.jpg'),
            fit: BoxFit.fill,
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    
  }

  Future<void> checkUserloggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      // gotologin();
      Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => LoginPage(),
    ));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Screenhome()),
      );
    }
  }
}
