import 'package:flutter/material.dart';
import 'package:petfeed/dependencies.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/pages/device_setup/device_calibration.dart';
import 'package:petfeed/src/pages/device_setup/device_register.dart';
import 'package:petfeed/src/pages/device_setup/wifi_setup.dart';
import 'package:petfeed/src/pages/getting_started/getting_started.dart';
import 'package:petfeed/src/pages/login/login.dart';
import 'package:petfeed/src/pages/pet_setup/pet_setup.dart';
import 'package:petfeed/src/pages/petfeed/petfeed_page.dart';
import 'package:petfeed/src/pages/register/register.dart';
import 'package:petfeed/src/pages/schedules/schedules.dart';
import 'package:petfeed/src/pages/setup/setup_page.dart';
import 'package:petfeed/src/pages/splash_screen/splash_screen.dart';

void main() async {
  await initKiwi();
  runApp(PetFeed());
}

class PetFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetFeed',
      theme: ThemeData(fontFamily: 'Nunito'),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.ROOT: (context) => SplashScreen(),
        Routes.LOGIN: (context) => LoginPage(),
        Routes.PETFEED: (context) => PetFeedPage(),
        Routes.REGISTER: (context) => RegisterPage(),
        Routes.SPLASH_SCREEN: (context) => SplashScreen(),
        Routes.GETTING_STARTED: (context) => GettingStarted(),
        Routes.DEVICE_LOGIN: (context) => DeviceLogin(),
        Routes.WIFI_SETUP: (context) => WifiSetup(),
        Routes.CALLIBRATE_DEVICE: (context) => DeviceCalibration(),
        Routes.PET_SETUP: (context) => PetSetup(),
        Routes.SCHEDULES: (context) => Schedules(),
        Routes.SETUP_PAGE: (context) => SetupPage(),
      },
    );
  }
}
