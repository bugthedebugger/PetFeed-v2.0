import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class ChatBubble extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const ChatBubble({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      width: ScreenUtil().setWidth(width),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(5),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            ScreenUtil().setWidth(30),
          ),
          topRight: Radius.circular(
            ScreenUtil().setWidth(30),
          ),
          bottomRight: Radius.circular(
            ScreenUtil().setWidth(30),
          ),
        ),
      ),
      child: child,
    );
  }
}
