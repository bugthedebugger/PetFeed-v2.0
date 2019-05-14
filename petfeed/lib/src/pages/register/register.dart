import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/register_bloc/register_bloc_export.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String email;
  String password;
  String rePassword;
  final _formKey = GlobalKey<FormState>();
  final RegisterBloc registerBloc = kiwi.Container().resolve<RegisterBloc>();
  StreamSubscription _subscription;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool verificationSent = false;
  @override
  void initState() {
    super.initState();
    _subscription = registerBloc.registerEventStream.listen(
      (event) {
        if (event is InitializingRegistration ||
            event is SendVerificationEmail) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return LoadingDialog();
            },
          );
        } else if (event is RegistrationSuccessful) {
          verificationSent = true;
          Navigator.of(context).pop();
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                "Verification email has been sent, please verifiy email first!",
                style: TextStyle(
                  fontSize: FontSize.fontSize12,
                ),
              ),
              duration: Duration(minutes: 10),
              action: SnackBarAction(
                label: 'Resend Email',
                onPressed: () {
                  registerBloc.reSendVerificationEmail(
                      email: email, password: password);
                },
              ),
            ),
          );
        } else if (event is RegistrationError) {
          Navigator.of(context).pop();
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(event.message),
              action: SnackBarAction(
                label: 'ok',
                onPressed: () {},
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black87,
            size: FontSize.fontSize20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(50),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: ScreenUtil().setHeight(40)),
                PetFeedLogo(),
                SizedBox(height: ScreenUtil().setHeight(40)),
                PetfeedTextField(
                  label: 'Name',
                  hint: 'Bhunte\'s Dad',
                  validator: (data) {
                    if (data.length < 6)
                      return 'Name must be atleast 6 characters!';
                    else
                      name = data;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                PetfeedTextField(
                  label: 'Email',
                  hint: 'bhunte@petfeed.com',
                  validator: (data) {
                    if (data.indexOf('@') == -1 || data.indexOf('.') == -1)
                      return 'Enter a valid email address.';
                    else
                      email = data;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                PetfeedTextField(
                  label: 'Password',
                  hint: 'my-super-secret-password',
                  obscure: true,
                  validator: (data) {
                    if (data.length < 6)
                      return 'Password must be atleast 6 characters long';
                    else
                      password = data;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                PetfeedTextField(
                  label: 'Confirm Password',
                  hint: 'my-super-secret-password',
                  obscure: true,
                  validator: (data) {
                    if (data != password)
                      return 'Confirm Password does not match.';
                    else
                      rePassword = data;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
                Container(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(60),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(30),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          registerBloc.register(
                            name: name,
                            email: email,
                            password: password,
                          );
                        }
                      },
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10),
                          horizontal: ScreenUtil().setWidth(40),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.fontSize12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
