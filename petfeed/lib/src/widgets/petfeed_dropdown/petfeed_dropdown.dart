import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/font_size.dart';

class PetFeedDropDown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function onChanged;
  final String label;
  final String value;
  final String hint;

  const PetFeedDropDown({
    Key key,
    @required this.items,
    @required this.onChanged,
    @required this.label,
    this.hint,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            ScreenUtil().setHeight(15),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            ScreenUtil().setHeight(15),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            ScreenUtil().setHeight(15),
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black87,
          fontSize: FontSize.fontSize12,
        ),
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: FontSize.fontSize12,
        ),
        hintText: hint,
      ),
      hint: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10),
        ),
        width: ScreenUtil().setWidth(200),
        height: ScreenUtil().setHeight(40),
        child: Text('Select the type of pet'),
      ),
      onChanged: onChanged,
      value: value,
    );
  }
}
