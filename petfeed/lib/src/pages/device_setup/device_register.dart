import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';

class DeviceLogin extends StatefulWidget {
  @override
  _DeviceLoginState createState() => _DeviceLoginState();
}

class _DeviceLoginState extends State<DeviceLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(10),
          horizontal: ScreenUtil().setWidth(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PetFeedLogo(),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Device setup (2/3): Register Device',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                    width: ScreenUtil().setWidth(300),
                    height: ScreenUtil().setHeight(300),
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: ScreenUtil().setSp(3),
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          spreadRadius: ScreenUtil().setSp(3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        PetFeedTextField(
                          label: 'Device ID',
                          hint: 'xxxxxxxxxx',
                        ),
                        SizedBox(height: ScreenUtil().setHeight(15)),
                        PetFeedTextField(
                          label: 'Password',
                          hint: '16 digit code',
                        ),
                        SizedBox(height: ScreenUtil().setHeight(35)),
                        Center(
                          child: RaisedButton(
                            color: Color(AppColors.BLUE),
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(50),
                              vertical: ScreenUtil().setHeight(10),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(30),
                              ),
                            ),
                            onPressed: () {
                              // TODO: ADD THE DEVICE LOGIN LOGIC
                              Navigator.of(context)
                                  .pushNamed(Routes.CALLIBRATE_DEVICE);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
