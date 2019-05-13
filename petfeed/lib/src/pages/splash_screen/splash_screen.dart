import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/assets/screen_size.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    change();
    super.initState();
  }

  void change() {
    Future.delayed(Duration(milliseconds: 3000)).then(
      (onValue) => Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.LOGIN, (predicate) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: PetFeedLogo(inverted: true),
      ),
    );
  }
}
