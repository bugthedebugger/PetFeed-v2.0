import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';

class LoginPage extends StatelessWidget {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PetFeedLogo(),
            SizedBox(height: ScreenUtil().setHeight(40)),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(10),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: FontSize.fontSize12,
                ),
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: FontSize.fontSize12,
                ),
                hintText: "example@petfeed.com",
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(10),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: FontSize.fontSize12,
                ),
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: FontSize.fontSize12,
                ),
                hintText: "my super secret password",
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(40)),
            Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(30),
                  ),
                ),
                onPressed: () {},
                color: Color(0xff0197D6),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(20),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
