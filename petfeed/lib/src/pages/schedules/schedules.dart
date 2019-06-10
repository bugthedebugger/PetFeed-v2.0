import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_export.dart';
import 'package:petfeed/src/widgets/add_schedule_dialog/add_schedule_dialog.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/recommended_schedule/recommended_schedule.dart';
import 'package:petfeed/src/widgets/schedule_card/schedule_card.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:petfeed/src/data/database/models/schedule.dart' as dbSchedule;
import 'package:shared_preferences/shared_preferences.dart';

class Schedules extends StatefulWidget {
  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final SchedulesBloc bloc = kiwi.Container().resolve<SchedulesBloc>();
  final SharedPreferences preferences =
      kiwi.Container().resolve<SharedPreferences>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription _sub;

  @override
  void initState() {
    bloc.getSchedules();
    _sub = bloc.eventStream.listen(
      (event) {
        if (event is ApplyRecommended) {
          showDialog(
            context: context,
            builder: (context) {
              return LoadingDialog();
            },
          );
        } else if (event is ScheduleError) {
          scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                event.message,
                style: TextStyle(
                  fontSize: FontSize.fontSize12,
                ),
              ),
            ),
          );
        } else if (event is ApplyRecommendedError) {
          Navigator.of(context).pop();
          scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                event.message,
                style: TextStyle(
                  fontSize: FontSize.fontSize12,
                ),
              ),
            ),
          );
        } else if (event is ApplyRecommendedSuccess) {
          Navigator.of(context).pop();
        } else if (event is ApplyRecommendedClosed) {
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    _sub?.cancel();
    super.dispose();
  }

  List<TimeOfDay> feedTimes = List<TimeOfDay>();
  List<String> feedDays = List<String>();
  List<String> groupIDs = List<String>();

  Stream dataStream;

  @override
  Widget build(BuildContext context) {
    dataStream = bloc.dataStream;
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: PetFeedLogo(),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Schedules',
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.fontSize16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            StreamBuilder<Map<String, List<dbSchedule.Schedule>>>(
              stream: dataStream,
              builder: (context, snapshot) {
                print(snapshot);

                if (snapshot.hasData) {
                  groupIDs.clear();
                  if (snapshot.data.isNotEmpty) {
                    snapshot.data.forEach((key, value) {
                      groupIDs.add(key);
                    });
                  }
                  return Column(
                    children: <Widget>[
                      if ((preferences.getString('petType') == 'Dog' ||
                              preferences.getString('petType') == 'Cat') &&
                          (preferences.getBool('close') != true)) ...[
                        BlocProvider(
                          bloc: bloc,
                          child: RecommendedSchedule(),
                        ),
                      ],
                      Container(
                        height: (preferences.getString('petType') == 'Dog' ||
                                preferences.getString('petType') == 'Cat')
                            ? ScreenUtil().setHeight(385)
                            : ScreenUtil().setHeight(500),
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length + 2,
                          itemBuilder: (context, index) {
                            if (index == snapshot.data.length) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(15),
                                  horizontal: ScreenUtil().setWidth(15),
                                ),
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(10),
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
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return AddScheduleDialog();
                                      },
                                    ).then((onValue) {
                                      bloc.getSchedules();
                                    });
                                  },
                                  child: Text(
                                    'ADD SCHEDULE',
                                    style: TextStyle(
                                      color: Color(AppColors.GREEN),
                                      fontSize: FontSize.fontSize14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            } else if (index == snapshot.data.length + 1) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  // vertical: ScreenUtil().setHeight(15),
                                  horizontal: ScreenUtil().setWidth(15),
                                ),
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(10),
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
                                  onPressed: () async {
                                    bloc.deleteAllSchedules();
                                  },
                                  child: Text(
                                    'DELETE ALL SCHEDULES',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: FontSize.fontSize14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              feedDays.clear();
                              feedTimes.clear();
                              snapshot.data[groupIDs[index]].forEach(
                                (data) {
                                  if (feedDays.indexOf(data.day.substring(0, 3)
                                        ..toUpperCase()) ==
                                      -1) {
                                    feedDays.add(
                                      data.day.substring(0, 3)..toUpperCase(),
                                    );
                                  }
                                  var tempTime =
                                      TimeOfDay.fromDateTime(data.feedTime);
                                  if (feedTimes.indexOf(tempTime) == -1) {
                                    feedTimes.add(tempTime);
                                  }
                                },
                              );

                              return ScheduleCard(
                                feedTimes: feedTimes,
                                feedDays: feedDays,
                                amount:
                                    snapshot.data[groupIDs[index]][0].amount,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
