import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/Utils/bottom_bar.dart';

import '../Utils/app_constants.dart';
import '../Utils/colors_code.dart';
import '../Utils/hex_color.dart';
import '../Utils/my_routes.dart';
import '../Utils/navdrawer.dart';
import '../Utils/show.dart';
import 'bottomsTabs/history_tab.dart';
import 'bottomsTabs/home_tab.dart';
import 'bottomsTabs/wallet_tab.dart';

class DashBoard extends StatefulWidget {

  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {

    Future<bool> onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want exit from app ? '),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              child: new Text('Yes'),
            ),
          ],
        ),
      ));
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        // endDrawerEnableOpenDragGesture: true,
        drawer: NavDrawer(),
        // backgroundColor: HexColor(MyColors.primaryColor),
        bottomNavigationBar: BottomNavBar(onTap:(index){
          setState(() {
            AppConstants.index = index;
          });
        }),
        body: showScreens(AppConstants.index),
      ),
    );
  }


}
