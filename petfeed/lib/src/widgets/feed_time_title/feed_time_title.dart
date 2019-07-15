import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class FeedTimeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Row(
      children: <Widget>[
        Icon(
          FontAwesomeIcons.clock,
          size: FontSize.fontSize14,
        ),
        SizedBox(width: ScreenUtil().setWidth(15)),
        Text(
          'Feed Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: FontSize.fontSize14,
          ),
        ),
      ],
    );
  }
}
