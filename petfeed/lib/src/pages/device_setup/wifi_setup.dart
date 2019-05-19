import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/wifi_setup_bloc/wifi_setup_bloc_export.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class WifiSetup extends StatefulWidget {
  @override
  _WifiSetupState createState() => _WifiSetupState();
}

class _WifiSetupState extends State<WifiSetup> {
  final _bloc = kiwi.Container().resolve<WifiSetupBloc>();
  StreamSubscription _sub;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String ssid;
  String key;

  @override
  void initState() {
    super.initState();
    _sub = _bloc.eventStream.listen((event) {
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
        Navigator.of(context).pushNamed(Routes.DEVICE_LOGIN);
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    _bloc.dispose();
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
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PetFeedLogo(),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Device setup (1/3): Setup device WiFi',
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
                                  _bloc.setWifi(ssid: ssid, key: key);
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
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.DEVICE_LOGIN);
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: FontSize.fontSize12,
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
            ),
          ],
        ),
      ),
    );
  }
}
