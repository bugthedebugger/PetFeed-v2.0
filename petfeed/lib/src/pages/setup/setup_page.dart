import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/calibration_bloc/calibration_bloc_export.dart';
import 'package:petfeed/src/bloc/wifi_setup_bloc/wifi_setup_bloc_export.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _calibrationBloc = kiwi.Container().resolve<CalibrationBloc>();
  final _wifiBloc = kiwi.Container().resolve<WifiSetupBloc>();
  StreamSubscription _wifiSub;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String ssid;
  String key;

  @override
  void initState() {
    super.initState();
    _wifiSub = _wifiBloc.eventStream.listen((event) {
      print(event);
      if (event is WifiSetupInitialized) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => LoadingDialog(
                message: 'Searching for device... ETA: 1-5min',
              ),
        );
      } else if (event is WifiSetupFailed) {
        Navigator.of(context).pop();
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(event.message),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          ),
        );
      } else if (event is WifiSetupSuccess) {
        Navigator.of(context).pop();
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('WiFi setup successfully!'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _calibrationBloc.dispose();
    _wifiSub?.cancel();
    _wifiBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: PetFeedLogo(),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(10),
          top: ScreenUtil().setHeight(10),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Power Settings',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              Center(
                child: Container(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(200),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
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
                                  'Shutdown Device',
                                  textAlign: TextAlign.center,
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
                            onTap: () {},
                            child: Container(
                              height: ScreenUtil().setHeight(91),
                              width: ScreenUtil().setWidth(100),
                              decoration: BoxDecoration(
                                color: Color(AppColors.GREEN),
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
                                  'Restart Device',
                                  textAlign: TextAlign.center,
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(15)),
              Text(
                'Calibrate Device',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              Center(
                child: Container(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _calibrationBloc.startHopper();
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
                              _calibrationBloc.reverseHopper();
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(91),
                              width: ScreenUtil().setWidth(100),
                              decoration: BoxDecoration(
                                color: Color(AppColors.GREEN),
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
                                  'Reverse Hopper',
                                  textAlign: TextAlign.center,
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
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _calibrationBloc.stopHopper();
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
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(15)),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Setup device WiFi',
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
                              label: 'SSID',
                              hint: 'PetFeed WiFi',
                              validator: (value) {
                                if (value.length < 6)
                                  return 'SSID must be atleast 6 characters long.';
                                else
                                  ssid = value;
                              },
                            ),
                            SizedBox(height: ScreenUtil().setHeight(15)),
                            PetFeedTextField(
                              label: 'KEY',
                              hint: 'my-super-secret-wifi',
                              validator: (value) {
                                if (value.length < 8)
                                  return 'KEY must be atleast 8 characters long.';
                                else
                                  key = value;
                              },
                              obscure: true,
                              keyBoardType: TextInputType.text,
                            ),
                            SizedBox(height: ScreenUtil().setHeight(30)),
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
                                  if (_formKey.currentState.validate()) {
                                    _wifiBloc.setWifi(ssid: ssid, key: key);
                                  }
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(15)),
            ],
          ),
        ),
      ),
    );
  }
}
