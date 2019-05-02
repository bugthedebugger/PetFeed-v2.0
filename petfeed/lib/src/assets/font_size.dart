import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screen_size.dart';

class FontSize {
  static const double _fontSize12 = 12.0;
  static const double _fontSize14 = 14.0;
  static const double _fontSize16 = 16.0;
  static const double _fontSize18 = 18.0;
  static const double _fontSize20 = 20.0;

  static double get fontSize12 => ScreenUtil(
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight,
        allowFontScaling: true,
      ).setSp(_fontSize12);
  static double get fontSize14 => ScreenUtil(
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight,
        allowFontScaling: true,
      ).setSp(_fontSize14);
  static double get fontSize16 => ScreenUtil(
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight,
        allowFontScaling: true,
      ).setSp(_fontSize16);
  static double get fontSize18 => ScreenUtil(
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight,
        allowFontScaling: true,
      ).setSp(_fontSize18);
  static double get fontSize20 => ScreenUtil(
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight,
        allowFontScaling: true,
      ).setSp(_fontSize20);
}
