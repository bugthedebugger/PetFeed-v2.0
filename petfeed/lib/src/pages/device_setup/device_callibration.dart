import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';

class DeviceCallibration extends StatefulWidget {
  @override
  _DeviceCallibrationState createState() => _DeviceCallibrationState();
}

class _DeviceCallibrationState extends State<DeviceCallibration> {
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
                    'Device setup (3/3): Calibrate Device',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // TODO: Add hopper start login
                              },
                              child: Container(
                                height: ScreenUtil().setHeight(91),
                                width: ScreenUtil().setWidth(100),
                                decoration: BoxDecoration(
                                  color: Color(AppColors.BLUE),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: ScreenUtil().setWidth(3),
                                      color: Colors.black12,
                                      offset: Offset(0, 1),
                                      spreadRadius: ScreenUtil().setWidth(1),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Start Hopper',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setWidth(14),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Add hopper start login
                              },
                              child: Container(
                                height: ScreenUtil().setHeight(91),
                                width: ScreenUtil().setWidth(100),
                                decoration: BoxDecoration(
                                  color: Color(AppColors.BLACK),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: ScreenUtil().setWidth(3),
                                      color: Colors.black12,
                                      offset: Offset(0, 1),
                                      spreadRadius: ScreenUtil().setWidth(1),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Stop Hopper',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setWidth(14),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(35)),
                        Center(
                          child: RaisedButton(
                            color: Color(AppColors.GREEN),
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
                              Navigator.of(context).pushNamed(Routes.PET_SETUP);
                            },
                            child: Text(
                              'Done',
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
