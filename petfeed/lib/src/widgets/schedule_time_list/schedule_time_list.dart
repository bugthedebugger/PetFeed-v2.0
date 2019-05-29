import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class TimeList extends StatelessWidget {
  final List<TimeOfDay> feedTimes;

  const TimeList({Key key, @required this.feedTimes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: feedTimes.length,
      itemBuilder: (context, index) {
        return Container(
          height: ScreenUtil().setHeight(20),
          width: ScreenUtil().setWidth(90),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(AppColors.GREEN),
                minRadius: ScreenUtil().setHeight(4),
                maxRadius: ScreenUtil().setHeight(5),
              ),
              SizedBox(width: ScreenUtil().setWidth(5)),
              Text(
                feedTimes[index].format(context),
                style: TextStyle(
                  color: Color(AppColors.GREEN),
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
