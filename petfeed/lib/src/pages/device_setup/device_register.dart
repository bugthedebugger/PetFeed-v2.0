import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/device_register_bloc/device_register_bloc_export.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class DeviceLogin extends StatefulWidget {
  @override
  _DeviceLoginState createState() => _DeviceLoginState();
}

class _DeviceLoginState extends State<DeviceLogin> {
  final _bloc = kiwi.Container().resolve<DeviceRegisterBloc>();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String deviceID;
  String password;

  StreamSubscription _sub;

  @override
  void initState() {
    _sub = _bloc.eventStream.listen((event) {
      if (event is DeviceRegisterInitiated) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LoadingDialog(
              message: 'Searching for device ...',
            );
          },
        );
      } else if (event is SendRegisterToServer) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LoadingDialog(
              message: 'Registering device ...',
            );
          },
        );
      } else if (event is DeviceRegisterSuccess) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(Routes.CALLIBRATE_DEVICE);
      } else if (event is DeviceRegisterError) {
        Navigator.of(context).pop();
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              event.message,
              style: TextStyle(fontSize: FontSize.fontSize12),
            ),
            action: SnackBarAction(
              label: 'ok',
              onPressed: () {},
            ),
          ),
        );
      }
    });
    super.initState();
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
                            validator: (value) {
                              if (value.length < 16) {
                                return 'Device ID should be 16 characters long!';
                              } else {
                                deviceID = value;
                              }
                            },
                          ),
                          SizedBox(height: ScreenUtil().setHeight(15)),
                          PetFeedTextField(
                            label: 'Password',
                            hint: '16 digit code',
                            validator: (value) {
                              if (value.length < 16) {
                                return 'Password should be atleast 16 digits';
                              } else {
                                password = value;
                              }
                            },
                          ),
                          SizedBox(height: ScreenUtil().setHeight(30)),
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
                                if (_formKey.currentState.validate()) {
                                  _bloc.registerDevice(
                                    id: deviceID,
                                    password: password,
                                  );
                                }
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
            ),
          ],
        ),
      ),
    );
  }
}
