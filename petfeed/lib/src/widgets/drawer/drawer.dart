import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/data/database/database_name.dart';
import 'package:petfeed/src/widgets/logo/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:sqflite/sqflite.dart';

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
            onTap: () async {
              var databasesPath = await getDatabasesPath();
              String path = join(databasesPath, DATABASE_NAME);
              await deleteDatabase(path);
              preferences.clear();
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.LOGIN,
                (predicate) => false,
              );
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
