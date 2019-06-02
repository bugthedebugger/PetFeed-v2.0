import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/count_down_bloc/count_down_bloc_export.dart';
import 'package:petfeed/src/widgets/clock_card/clock_card.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key key}) : super(key: key);

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  final TimerBloc _bloc = kiwi.Container().resolve<TimerBloc>();
  bool blink = true;

  @override
  void initState() {
    super.initState();
    _bloc.startTimer();
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return StreamBuilder<Map<String, dynamic>>(
      stream: _bloc.dataStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          blink = snapshot.data['blink'];
        }

        return Row(
          children: <Widget>[
            ClockCard(time: snapshot.hasData ? snapshot.data['hour1'] : 0),
            SizedBox(width: ScreenUtil().setWidth(5)),
            ClockCard(time: snapshot.hasData ? snapshot.data['hour2'] : 0),
            SizedBox(width: ScreenUtil().setWidth(5)),
            Text(
              ':',
              style: TextStyle(
                color: blink ? Colors.black26 : Colors.white,
                fontSize: FontSize.fontSize28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(5)),
            ClockCard(time: snapshot.hasData ? snapshot.data['min1'] : 0),
            SizedBox(width: ScreenUtil().setWidth(5)),
            ClockCard(time: snapshot.hasData ? snapshot.data['min2'] : 0),
            SizedBox(width: ScreenUtil().setWidth(5)),
          ],
        );
      },
    );
  }
}
