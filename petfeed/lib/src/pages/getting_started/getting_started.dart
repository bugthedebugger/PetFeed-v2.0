import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';

class GettingStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          left: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PetFeedLogo(),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Image.asset(
              Photos.ON_BOARDING,
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(150),
              fit: BoxFit.contain,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Before we begin',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color(AppColors.BLACK),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Text(
                    'Let\'s setup your device.',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color(AppColors.BLACK),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
                right: ScreenUtil().setWidth(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              padding:
                                  EdgeInsets.all(ScreenUtil().setWidth(10)),
                              color: Colors.white,
                              width: ScreenUtil().setHeight(200),
                              height: ScreenUtil().setHeight(120),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'To setup the device, create a hotspot with the name "PetFeed" and password "petfeed123".',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                            Routes.WIFI_SETUP,
                                            (predicate) => false,
                                          );
                                        },
                                        child: Text(
                                          'Ok',
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Begin Setup',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenUtil().setSp(18),
                        color: Color(AppColors.ORANGE),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
