import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';

class PetfeedTextField extends StatelessWidget {
  final Function validator;
  final String hint;
  final String label;
  final bool obscure;

  const PetfeedTextField({
    Key key,
    this.validator,
    this.hint,
    this.label,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return TextFormField(
      obscureText: obscure,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
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
    );
  }
}
