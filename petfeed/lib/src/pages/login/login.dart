import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();

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
                label: 'Email',
                hint: 'bhunte@petfeed.com',
                validator: (data) {
                  if (data.lastIndexOf('@') == -1 ||
                      data.lastIndexOf('.') == -1)
                    return "Please enter a valid email address";
                  else
                    email = data;
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              PetfeedTextField(
                label: 'Password',
                hint: 'my-super-secret-password',
                validator: (data) {
                  if (data.length < 6)
                    return "Password must be atleast 6 characters long";
                  else
                    password = data;
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(60)),
              Container(
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(30),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // TODO: Add login logic
                          }
                        },
                        color: Colors.black,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(10),
                            horizontal: ScreenUtil().setWidth(40),
                          ),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.fontSize12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.REGISTER);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: FontSize.fontSize12,
                            ),
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: FontSize.fontSize12,
                              color: Colors.blueAccent,
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
      ),
    );
  }
}
