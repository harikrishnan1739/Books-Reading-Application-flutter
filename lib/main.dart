import 'package:flutter/material.dart';

import 'Splashscrren.dart';
import 'login.dart';

 const SAVE_KEY_NAME = 'UserLoggedIn';


void main(){
  runApp( Myapp());
}
class Myapp extends StatelessWidget {
   Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),

    );
  }
}
