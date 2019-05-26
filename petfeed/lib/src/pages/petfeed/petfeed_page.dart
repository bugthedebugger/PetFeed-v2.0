import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/petfeed_bloc/petfeed_bloc_export.dart';
import 'package:petfeed/src/widgets/bottom_flow_widget/bottom_flow_widget.dart';
import 'package:petfeed/src/widgets/chat_bubble/chat_bubble.dart';
import 'package:petfeed/src/widgets/count_down_timer/count_down_widget.dart';
import 'package:petfeed/src/widgets/food_meter/food_meter.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/petfeed_card/petfeed_card.dart';
import 'package:petfeed/src/widgets/radial_slider/radial_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class PetFeedPage extends StatefulWidget {
  @override
  _PetFeedPageState createState() => _PetFeedPageState();
}

class _PetFeedPageState extends State<PetFeedPage> {
  final SharedPreferences preferences =
      kiwi.Container().resolve<SharedPreferences>();
  final PetFeedBloc _bloc = kiwi.Container().resolve<PetFeedBloc>();

  String deviceType;
  String petName;
  String treatWeight = '0.50';
  double foodRemain = 11.4;

  StreamSubscription _eventSub;
  StreamSubscription _pusherSub;

  @override
  void initState() {
    _eventSub = _bloc.eventStream.listen((event) {
      print(event);
    });

    _pusherSub = _bloc.pusherStream.listen((event) {
      print(event);
    });

    deviceType = preferences.get('petType');
    petName = preferences.get('pet');
    super.initState();
  }

  @override
  void dispose() {
    _eventSub?.cancel();
    _pusherSub?.cancel();
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
                  child: FoodMeter(percentRemain: foodRemain),
                ),
                // Information Cards
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(10),
                    bottom: ScreenUtil().setHeight(10),
                    right: ScreenUtil().setWidth(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    StreamBuilder(
                                      stream: _bloc.pusherStream,
                                      builder: (context, snapshot) {
                                        return Icon(
                                          snapshot.hasData
                                              ? Icons.signal_cellular_4_bar
                                              : Icons.signal_cellular_off,
                                          size: FontSize.fontSize18,
                                          color: Colors.black,
                                        );
                                      },
                                    ),
                                    SizedBox(width: ScreenUtil().setWidth(10)),
                                    StreamBuilder<bool>(
                                      stream: _bloc.localConnectionStream,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Icon(
                                            snapshot.data
                                                ? Icons.signal_wifi_4_bar
                                                : Icons.signal_wifi_off,
                                            size: FontSize.fontSize18,
                                            color: Colors.black,
                                          );
                                        } else {
                                          return SizedBox(
                                            width: FontSize.fontSize12,
                                            height: FontSize.fontSize12,
                                            child: Theme(
                                              data: ThemeData(
                                                accentColor: Colors.black,
                                              ),
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          );
                                        }
                                      },
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
                                      '$petName has been fed 2 times today.',
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
                          minFood: 0.5,
                          maxFood: deviceType == 'Fish' ? 1.5 : 50,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: ScreenUtil().setHeight(15)),
                              Text(
                                '$treatWeight ${deviceType == "Fish" ? "ms" : "gm"}',
                                style: TextStyle(
                                  fontSize: FontSize.fontSize16,
                                ),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.paw),
                                onPressed: () {
                                  _bloc.treat(
                                    amount: double.parse(treatWeight),
                                  );
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
