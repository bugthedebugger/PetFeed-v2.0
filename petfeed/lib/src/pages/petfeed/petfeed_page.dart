import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/count_down_timer/count_down_widget.dart';
import 'package:petfeed/src/widgets/food_meter/food_meter.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/petfeed_card/petfeed_card.dart';

class PetFeedPage extends StatefulWidget {
  @override
  _PetFeedPageState createState() => _PetFeedPageState();
}

class _PetFeedPageState extends State<PetFeedPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: PetFeedLogo(),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: ScreenUtil().setWidth(15),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // FoodMeter
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(15),
                  ),
                  child: FoodMeter(percentRemain: 100),
                ),
                // Information Cards
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(10),
                    bottom: ScreenUtil().setHeight(10),
                    right: ScreenUtil().setWidth(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      PetFeedCard(
                        height: 100,
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Time to the next feed: ",
                                  style: TextStyle(
                                    fontSize: FontSize.fontSize14,
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.wifi,
                                  size: FontSize.fontSize12,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            CountDownTimer(
                              countDownTo: TimeOfDay(hour: 23, minute: 00),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
