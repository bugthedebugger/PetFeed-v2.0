import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/bloc/bloc_provider.dart';
import 'package:petfeed/src/bloc/petfeed_bloc/petfeed_bloc_export.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class AppDrawer extends StatelessWidget {
  final SharedPreferences preferences =
      kiwi.Container().resolve<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);
    PetFeedBloc bloc = BlocProvider.of<PetFeedBloc>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: PetFeedLogo(),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: ListTile(
              dense: true,
              leading: Icon(
                FontAwesomeIcons.home,
                color: Colors.black,
                size: FontSize.fontSize14,
              ),
              title: Text(
                'HOME',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.fontSize14,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.SETUP_PAGE);
            },
            child: ListTile(
              dense: true,
              leading: Icon(
                FontAwesomeIcons.wrench,
                color: Colors.black,
                size: FontSize.fontSize14,
              ),
              title: Text(
                'SETUP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.fontSize14,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.SCHEDULES);
            },
            child: ListTile(
              dense: true,
              leading: Icon(
                FontAwesomeIcons.calendarAlt,
                color: Colors.black,
                size: FontSize.fontSize14,
              ),
              title: Text(
                'SCHEDULE',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.fontSize14,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              bloc.logout();
            },
            child: ListTile(
              dense: true,
              leading: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.black,
                size: FontSize.fontSize14,
              ),
              title: Text(
                'LOGOUT',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.fontSize14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
