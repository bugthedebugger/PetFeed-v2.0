import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/clock_card/clock_card.dart';

class CountDownTimer extends StatefulWidget {
  final TimeOfDay countDownTo;

  const CountDownTimer({Key key, @required this.countDownTo}) : super(key: key);

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  int h1 = 0;
  int h2 = 0;
  int m1 = 0;
  int m2 = 0;
  bool blink = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        h2 = (widget.countDownTo.hour - TimeOfDay.now().hour) % 10;
        h1 = (widget.countDownTo.hour - TimeOfDay.now().hour) ~/ 10;
        m2 = (widget.countDownTo.minute - TimeOfDay.now().minute) % 10;
        m1 = (widget.countDownTo.minute - TimeOfDay.now().minute) ~/ 10;
        if (h2 < 0) h2 = 5 + h2;
        if (h1 < 0) h1 = 5 + h1;
        if (m2 < 0) m2 = 5 + m2;
        if (m1 < 0) m1 = 5 + m1;
        blink = !blink;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Row(
      children: <Widget>[
        ClockCard(time: h1),
        SizedBox(width: ScreenUtil().setWidth(10)),
        ClockCard(time: h2),
        SizedBox(width: ScreenUtil().setWidth(10)),
        Text(
          ':',
          style: TextStyle(
            color: blink ? Colors.black26 : Colors.white,
            fontSize: FontSize.fontSize28,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: ScreenUtil().setWidth(10)),
        ClockCard(time: m1),
        SizedBox(width: ScreenUtil().setWidth(10)),
        ClockCard(time: m2),
        SizedBox(width: ScreenUtil().setWidth(10)),
      ],
    );
  }
}
