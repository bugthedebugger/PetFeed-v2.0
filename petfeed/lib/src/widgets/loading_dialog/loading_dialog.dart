import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  final bool error;

  const LoadingDialog({
    Key key,
    this.message = 'Please wait ...',
    this.error = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        height: ScreenUtil().setHeight(50),
        child: Row(
          children: <Widget>[
            !this.error
                ? SizedBox(
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setHeight(20),
                    child: Theme(
                      data: ThemeData(
                        accentColor: Colors.black,
                      ),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  )
                : Container(),
            !this.error
                ? SizedBox(width: ScreenUtil().setWidth(15))
                : Container(),
            Text(
              message,
              style: TextStyle(
                fontSize: FontSize.fontSize12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
