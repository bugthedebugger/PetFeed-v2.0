import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class ScheduleCheckbox extends StatelessWidget {
  final String label;
  final bool selected;
  final Function onChanged;

  const ScheduleCheckbox({
    Key key,
    @required this.label,
    @required this.selected,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      width: ScreenUtil().setWidth(130),
      height: ScreenUtil().setHeight(30),
      child: Row(
        children: <Widget>[
          Checkbox(
            onChanged: onChanged,
            value: selected,
            activeColor: Color(AppColors.BLUE),
          ),
          SizedBox(width: ScreenUtil().setWidth(5)),
          Text(
            '$label',
            style: TextStyle(
              fontSize: FontSize.fontSize12,
            ),
          )
        ],
      ),
    );
  }
}
