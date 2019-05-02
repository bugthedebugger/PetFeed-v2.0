import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class ClockCard extends StatelessWidget {
  final int time;

  const ClockCard({Key key, this.time = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      height: ScreenUtil().setHeight(50),
      width: ScreenUtil().setWidth(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(5),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.black45,
          ],
        ),
      ),
      child: Center(
        child: Text(
          '$time',
          style: TextStyle(
            color: Colors.white,
            fontSize: FontSize.fontSize24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
