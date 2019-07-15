import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_export.dart';
import 'package:petfeed/src/widgets/petfeed_card/petfeed_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class RecommendedSchedule extends StatefulWidget {
  RecommendedSchedule({
    Key key,
  }) : super(key: key);

  @override
  _RecommendedScheduleState createState() => _RecommendedScheduleState();
}

class _RecommendedScheduleState extends State<RecommendedSchedule> {
  final SharedPreferences preferences =
      kiwi.Container().resolve<SharedPreferences>();
  SchedulesBloc _bloc;
  String _amount;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<SchedulesBloc>(context);
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    if (preferences.getString('petType') == 'Dog')
      _amount = (38.94 * (pow(preferences.getDouble("weight"), 0.75)))
          .toStringAsFixed(2);
    else if (preferences.getString('petType') == 'Cat')
      _amount = (preferences.getDouble("weight") * 8.6312).toStringAsFixed(2);

    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
      child: PetFeedCard(
        height: 115,
        width: ScreenUtil().width,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Recommended: ',
                  style: TextStyle(
                    fontSize: FontSize.fontSize14,
                    color: Color(AppColors.BLUE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Amount: ',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                        color: Color(AppColors.BLACK),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(5)),
                    Text(
                      '${_amount}gm per day',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                        color: Color(AppColors.BLACK),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Times: ',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                        color: Color(AppColors.BLACK),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '3 portions',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                        color: Color(AppColors.BLACK),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Repeat: ',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                        color: Color(AppColors.BLACK),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Everyday',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                        color: Color(AppColors.BLACK),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: ScreenUtil().setWidth(30)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(2),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(AppColors.GREEN),
                        width: ScreenUtil().setWidth(2.5),
                      ),
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(30),
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      List<String> feedTimes = [
                        DateTime(1996, 1, 1, 7, 00).toLocal().toString(),
                        DateTime(1996, 1, 1, 13, 00).toLocal().toString(),
                        DateTime(1996, 1, 1, 19, 00).toLocal().toString(),
                      ];
                      List<String> repeatDays = [
                        'Sunday',
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday',
                      ];
                      double amount = double.parse(
                          (double.parse(_amount) / 3).toStringAsExponential(2));
                      _bloc.applyRecommended(
                        amount: amount,
                        feedTimes: feedTimes,
                        repeat: repeatDays,
                      );
                    },
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Color(AppColors.GREEN),
                        fontSize: FontSize.fontSize12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(2),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.redAccent,
                        width: ScreenUtil().setWidth(2.5),
                      ),
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(30),
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      _bloc.applyRecommendedClosed();
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: FontSize.fontSize12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
