import 'package:flutter/material.dart';
import 'package:petfeed/dependencies.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/pages/login/login.dart';
import 'package:petfeed/src/pages/petfeed/petfeed_page.dart';
import 'package:petfeed/src/pages/register/register.dart';
import 'package:petfeed/src/pages/splash_screen/splash_screen.dart';

void main() async {
  await initKiwi();
  runApp(PetFeed());
}

class PetFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.ROOT: (context) => SplashScreen(),
        Routes.LOGIN: (context) => LoginPage(),
        Routes.PETFEED: (context) => PetFeedPage(),
        Routes.REGISTER: (context) => RegisterPage(),
        Routes.SPLASH_SCREEN: (context) => SplashScreen(),
      },
    );
  }
}
