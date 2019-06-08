import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/feed_time_title/feed_time_title.dart';
import 'package:petfeed/src/widgets/petfeed_card/petfeed_card.dart';
import 'package:petfeed/src/widgets/schedule_day_list/schedule_day_list.dart';
import 'package:petfeed/src/widgets/schedule_time_list/schedule_time_list.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleCard extends StatelessWidget {
  ScheduleCard({
    Key key,
    @required this.feedTimes,
    @required this.feedDays,
    this.amount = 0.1,
  }) : super(key: key);

  final List<TimeOfDay> feedTimes;
  final List<String> feedDays;
  final double amount;
  final SharedPreferences preferences =
      kiwi.Container().resolve<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
      child: PetFeedCard(
        height: 115,
        width: ScreenUtil().width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FeedTimeTitle(),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Container(
              height: ScreenUtil().setHeight(20),
              child: TimeList(
                feedTimes: feedTimes,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.bone,
                  size: FontSize.fontSize14,
                ),
                SizedBox(width: ScreenUtil().setWidth(15)),
                Text(
                  '$amount ${preferences.getString("petType") == "Fish" ? "ms" : "gm"}',
                  style: TextStyle(
                    fontSize: FontSize.fontSize12,
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.calendar,
                  size: FontSize.fontSize14,
                ),
                SizedBox(width: ScreenUtil().setWidth(15)),
                Container(
                  height: ScreenUtil().setHeight(20),
                  width: ScreenUtil().setWidth(250),
                  child: ScheduleDayList(
                    feedDays: feedDays,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
