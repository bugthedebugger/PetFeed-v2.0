import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/data/network/pi_scanner.dart';
import 'package:petfeed/src/widgets/bottom_flow_widget/bottom_flow_widget.dart';
import 'package:petfeed/src/widgets/chat_bubble/chat_bubble.dart';
import 'package:petfeed/src/widgets/count_down_timer/count_down_widget.dart';
import 'package:petfeed/src/widgets/food_meter/food_meter.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/petfeed_card/petfeed_card.dart';
import 'package:petfeed/src/widgets/radial_slider/radial_slider.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

class PetFeedPage extends StatefulWidget {
  @override
  _PetFeedPageState createState() => _PetFeedPageState();
}

class _PetFeedPageState extends State<PetFeedPage> {
  String treatWeight = '0.50';

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
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(10),
              top: ScreenUtil().setHeight(5),
              bottom: ScreenUtil().setHeight(5),
            ),
            child: Container(
              width: ScreenUtil().setWidth(35),
              height: ScreenUtil().setWidth(35),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  Photos.BHUNTE,
                  fit: BoxFit.cover,
                ),
              ),
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
                  child: FoodMeter(percentRemain: 90),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.signal,
                                      size: FontSize.fontSize12,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: ScreenUtil().setWidth(10)),
                                    Icon(
                                      FontAwesomeIcons.ethernet,
                                      size: FontSize.fontSize16,
                                      color: Colors.green,
                                    ),
                                  ],
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
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      PetFeedCard(
                        width: 250,
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Status',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.fontSize12,
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.dog),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                ChatBubble(
                                  height: 40,
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      'Bhunte has been fed 2 times today.',
                                      style: TextStyle(
                                        fontSize: FontSize.fontSize12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      PetFeedCard(
                        width: 250,
                        height: 200,
                        child: RadialSlider(
                          onChange: _radialSliderChange,
                          init: 0,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: ScreenUtil().setHeight(15)),
                              Text(
                                '$treatWeight gm',
                                style: TextStyle(
                                  fontSize: FontSize.fontSize16,
                                ),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.paw),
                                onPressed: () {
                                  PiScanner pi =
                                      kiwi.Container().resolve<PiScanner>();
                                  pi.findDevice();
                                },
                                iconSize: ScreenUtil().setWidth(80),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FlowWidget(
            height: 80,
            width: ScreenUtil().setWidth(ScreenSize.screenWidth),
          ),
        ],
      ),
    );
  }

  _radialSliderChange(double food) {
    setState(() {
      treatWeight = food.toStringAsFixed(2);
    });
  }
}
