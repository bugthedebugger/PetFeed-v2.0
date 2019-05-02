import 'package:flutter/material.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/pages/login/login.dart';

void main() {
  runApp(PetFeed());
}

class PetFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.LOGIN: (context) => LoginPage(),
      },
      home: LoginPage(),
    );
  }
}
