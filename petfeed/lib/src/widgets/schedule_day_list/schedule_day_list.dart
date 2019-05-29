import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class ScheduleDayList extends StatelessWidget {
  final List<String> feedDays;

  const ScheduleDayList({Key key, @required this.feedDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: feedDays.length,
      itemBuilder: (context, index) {
        return Container(
          height: ScreenUtil().setHeight(20),
          width: ScreenUtil().setWidth(35),
          child: Row(
            children: <Widget>[
              Text(
                feedDays[index],
                style: TextStyle(
                  fontSize: FontSize.fontSize12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
