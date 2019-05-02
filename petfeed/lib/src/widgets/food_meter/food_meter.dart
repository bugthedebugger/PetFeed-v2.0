import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class FoodMeter extends StatelessWidget {
  final double meterHeight = 400.0;
  final double meterWidth = 20.0;
  final double percentRemain;

  /// percentRemain is 100 by default
  FoodMeter({Key key, this.percentRemain = 100}) : super(key: key) {
    assert(percentRemain >= 0 && percentRemain <= 100);
  }

  @override
  Widget build(BuildContext context) {
    final double remainHeight =
        meterHeight - ((meterHeight * (100 - percentRemain)) / 100);

    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(meterHeight),
          width: ScreenUtil().setWidth(meterWidth),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(15),
            ),
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: Duration(microseconds: 3000),
                top: ScreenUtil().setHeight(meterHeight - remainHeight),
                child: AnimatedContainer(
                  duration: Duration(microseconds: 3000),
                  height: ScreenUtil().setHeight(remainHeight),
                  width: ScreenUtil().setWidth(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: getColors(),
                    ),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        Text(
          "Food",
          style: TextStyle(fontSize: FontSize.fontSize12),
        ),
      ],
    );
  }

  getColors() {
    if (percentRemain >= 50)
      return [
        Colors.greenAccent,
        Colors.green,
        Colors.blue,
      ];
    else
      return [
        Colors.redAccent,
        Colors.red,
      ];
  }
}
