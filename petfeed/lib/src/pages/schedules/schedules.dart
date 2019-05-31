import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/schedules_bloc/schedules_bloc_export.dart';
import 'package:petfeed/src/widgets/add_schedule_dialog/add_schedule_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/schedule_card/schedule_card.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class Schedules extends StatefulWidget {
  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final SchedulesBloc bloc = kiwi.Container().resolve<SchedulesBloc>();
  Widget test;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  List<TimeOfDay> feedTimes = [
    TimeOfDay.now(),
    TimeOfDay.now(),
  ];

  List<String> feedDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    test = BlocProvider<SchedulesBloc>(
      bloc: bloc,
      child: AddScheduleDialog(),
    );
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemCount + 1,
              itemBuilder: (context, index) {
                if (index == itemCount) {
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return test;
                          },
                        );
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
                } else {
                  return ScheduleCard(
                    feedTimes: feedTimes,
                    feedDays: feedDays,
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
