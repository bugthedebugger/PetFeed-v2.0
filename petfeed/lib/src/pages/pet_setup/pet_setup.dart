import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/app_colors.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/pet_bloc/pet_bloc_export.dart';
import 'package:petfeed/src/widgets/loading_dialog/loading_dialog.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:petfeed/src/widgets/petfeed_dropdown/petfeed_dropdown.dart';
import 'package:petfeed/src/widgets/text_field/petfeed_text_field.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class PetSetup extends StatefulWidget {
  @override
  _PetSetupState createState() => _PetSetupState();
}

class _PetSetupState extends State<PetSetup> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _bloc = kiwi.Container().resolve<PetBloc>();
  StreamSubscription _sub;
  String _selectedPetType;
  String _petName;
  double _age;
  double _weight;

  List<DropdownMenuItem> _petType =
      <String>['Dog', 'Cat', 'Fish'].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  @override
  void initState() {
    _sub = _bloc.eventStream.listen((event) {
      if (event is PetRegisterInitiated) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return LoadingDialog();
            });
      } else if (event is PetRegisterError) {
        Navigator.of(context).pop();
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              event.message,
              style: TextStyle(
                fontSize: FontSize.fontSize12,
              ),
            ),
          ),
        );
      } else if (event is PetRegisterSuccessful) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.PETFEED,
          (predicate) => false,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    _bloc.dispose();
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
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              PetFeedLogo(),
              Form(
                key: _formKey,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Pet Information',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(5)),
                        Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(400),
                          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: ScreenUtil().setSp(3),
                                color: Colors.black12,
                                offset: Offset(0, 1),
                                spreadRadius: ScreenUtil().setSp(3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              PetFeedDropDown(
                                items: _petType,
                                label: 'Select your pet type.',
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPetType = value;
                                  });
                                },
                                value: _selectedPetType,
                                validator: (value) {
                                  if (value == null)
                                    return 'Pet type is requried.';
                                  else
                                    _selectedPetType = value;
                                },
                              ),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              PetFeedTextField(
                                label: 'Pet Name',
                                hint: 'Bhunte',
                                validator: (value) {
                                  if (value.length < 3)
                                    return 'Pet name should be atleast 3 characters';
                                  else
                                    _petName = value;
                                },
                              ),
                              if (_selectedPetType != 'Fish') ...[
                                SizedBox(height: ScreenUtil().setHeight(10)),
                                PetFeedTextField(
                                  label: 'Age in years',
                                  hint: 'Bhunte',
                                  keyBoardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == '')
                                      return 'Age should be > 0.1';
                                    else
                                      _age = double.parse(value);
                                  },
                                ),
                                SizedBox(height: ScreenUtil().setHeight(10)),
                                PetFeedTextField(
                                  label: 'Weight in Kilograms',
                                  hint: '10',
                                  keyBoardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == '')
                                      return 'Weight should be > 0.1';
                                    else
                                      _weight = double.parse(value);
                                  },
                                ),
                              ],
                              SizedBox(height: ScreenUtil().setHeight(35)),
                              Center(
                                child: RaisedButton(
                                  color: Color(AppColors.GREEN),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(50),
                                    vertical: ScreenUtil().setHeight(10),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _bloc.registerPet(
                                        name: _petName,
                                        type: _selectedPetType,
                                        age: _age,
                                        weight: _weight,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
