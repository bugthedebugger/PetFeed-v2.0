import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class PetFeedCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const PetFeedCard(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10),
      ),
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(0, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
