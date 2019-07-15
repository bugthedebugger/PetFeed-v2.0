import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_export.dart';
import 'package:petfeed/src/widgets/feed_time_title/feed_time_title.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/schedule_checkbox/schedule_checkbox.dart';
import 'package:petfeed/src/widgets/schedule_time_list/schedule_time_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class AddScheduleDialog extends StatefulWidget {
  const AddScheduleDialog({Key key}) : super(key: key);

  @override
  _AddScheduleDialogState createState() => _AddScheduleDialogState();
}

class _AddScheduleDialogState extends State<AddScheduleDialog> {
  final SharedPreferences preferences =
      kiwi.Container().resolve<SharedPreferences>();
  final formKey = GlobalKey<FormState>();

  final SchedulesBloc bloc = kiwi.Container().resolve<SchedulesBloc>();
  StreamSubscription _sub;

  List<TimeOfDay> feedTimesOfDay = List<TimeOfDay>();
  List<String> feedTimes = List<String>();
  List<String> repeatDays = ['Sunday'];

  bool sunday = true;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;

  double amount = 0.0;

  String deviceType = 'Fish';

  @override
  void initState() {
    _sub = bloc.eventStream.listen(_eventListener);
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    bloc?.dispose();
    super.dispose();
  }

  void _eventListener(event) {
    // print(event);

    if (event is AddSchedule) {
      // print('add');
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => LoadingDialog(),
      );
    } else if (event is ScheduleAddedSuccessfully) {
      // print('success');
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } else if (event is ScheduleError) {
      // print('error');
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => LoadingDialog(
              error: true,
              message: event.message,
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceType = preferences.getString('petType');

    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        height: ScreenUtil().setHeight(500),
        width: ScreenUtil().setWidth(300),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(50),
                color: Color(AppColors.BLUE),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(5),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add Schedule',
                  style: TextStyle(
                    fontSize: FontSize.fontSize18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(15),
                  horizontal: ScreenUtil().setWidth(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FeedTimeTitle(),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(270),
                      height: ScreenUtil().setHeight(20),
                      child: TimeList(
                        feedTimes: feedTimesOfDay,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay tempTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: 0,
                            minute: 0,
                          ),
                        );
                        setState(() {
                          if (tempTime != null) feedTimesOfDay.add(tempTime);
                        });
                        print(feedTimesOfDay);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                        ),
                        width: ScreenUtil().setWidth(270),
                        height: ScreenUtil().setHeight(30),
                        color: Colors.grey[200],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Select time: ',
                                style: TextStyle(
                                  fontSize: FontSize.fontSize14,
                                ),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.solidPlusSquare,
                              color: Color(AppColors.BLUE),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.bone,
                          size: FontSize.fontSize12,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Text(
                          'Food per Serving (gm or ms)',
                          style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(15),
                      ),
                      width: ScreenUtil().setWidth(270),
                      height: ScreenUtil().setHeight(30),
                      color: Colors.grey[200],
                      child: TextFormField(
                        initialValue: deviceType == 'Fish' ? '1.0' : '5.0',
                        validator: (value) {
                          if (deviceType == 'Fish') {
                            if (value.isEmpty) {
                              return 'Amount should be > 0.5 and < 3';
                            }
                            if (double.parse(value) < 0.5 ||
                                double.parse(value) > 3) {
                              return 'Amount should be > 0.5 and < 3';
                            } else {
                              amount = double.parse(value);
                            }
                          } else {
                            if (value.isEmpty) {
                              return 'Amount should be > 5 and < 200';
                            }
                            if (double.parse(value) < 5 ||
                                double.parse(value) > 200) {
                              return 'Amount should be > 5 and < 200';
                            } else {
                              amount = double.parse(value);
                            }
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.calendar,
                          size: FontSize.fontSize14,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Text(
                          'Repeat',
                          style: TextStyle(
                            fontSize: FontSize.fontSize14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ScreenUtil().setHeight(5),
                    ),
                    Row(
                      children: <Widget>[
                        ScheduleCheckbox(
                          label: 'Sunday',
                          onChanged: (value) =>
                              handleRepeatDays(value, 'Sunday'),
                          selected: sunday,
                        ),
                        ScheduleCheckbox(
                          label: 'Monday',
                          onChanged: (value) =>
                              handleRepeatDays(value, 'Monday'),
                          selected: monday,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ScheduleCheckbox(
                          label: 'Tuesday',
                          onChanged: (value) =>
                              handleRepeatDays(value, 'Tuesday'),
                          selected: tuesday,
                        ),
                        ScheduleCheckbox(
                          label: 'Wednesday',
                          onChanged: (value) =>
                              handleRepeatDays(value, 'Wednesday'),
                          selected: wednesday,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ScheduleCheckbox(
                          label: 'Thursday',
                          onChanged: (value) =>
                              handleRepeatDays(value, 'Thursday'),
                          selected: thursday,
                        ),
                        ScheduleCheckbox(
                          label: 'Friday',
                          onChanged: (value) =>
                              handleRepeatDays(value, 'Friday'),
                          selected: friday,
                        ),
                      ],
                    ),
                    ScheduleCheckbox(
                      label: 'Saturday',
                      onChanged: (value) => handleRepeatDays(value, 'Saturday'),
                      selected: saturday,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(82)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 0,
                          color: Color(AppColors.GREEN),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              if (feedTimesOfDay.isEmpty) {
                                if (feedTimes.indexOf(
                                        DateTime(1996, 1, 1, 12, 0)
                                            .toLocal()
                                            .toString()) ==
                                    -1) {
                                  feedTimes.add(
                                    DateTime(1996, 1, 1, 12, 0)
                                        .toLocal()
                                        .toString(),
                                  );
                                }
                              } else {
                                for (var t in feedTimesOfDay) {
                                  if (feedTimes.indexOf(
                                          DateTime(1996, 1, 1, t.hour, t.minute)
                                              .toLocal()
                                              .toString()) ==
                                      -1) {
                                    feedTimes.add(
                                      DateTime(1996, 1, 1, t.hour, t.minute)
                                          .toLocal()
                                          .toString(),
                                    );
                                  }
                                }
                              }
                              if (repeatDays.isEmpty) {
                                repeatDays.add('Sunday');
                              }
                              bloc.addSchedule(
                                amount: amount,
                                feedTimes: feedTimes,
                                repeat: repeatDays,
                              );
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.fontSize14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleRepeatDays(bool value, String day) {
    switch (day) {
      case 'Sunday':
        sunday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      case 'Monday':
        monday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      case 'Tuesday':
        tuesday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      case 'Wednesday':
        wednesday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      case 'Thursday':
        thursday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      case 'Friday':
        friday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      case 'Saturday':
        saturday = value;
        if (!value)
          repeatDays.remove(day);
        else
          repeatDays.add(day);
        break;
      default:
        sunday = true;
    }
    setState(() {});
  }
}
