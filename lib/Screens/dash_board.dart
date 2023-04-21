import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/app_constants.dart';
import '../Utils/colors_code.dart';
import '../Utils/hex_color.dart';
import '../Utils/my_routes.dart';
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
        // endDrawer: NavigationDrawer(),
        // backgroundColor: HexColor(MyColors.primaryColor),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: HexColor(MyColors.primaryColor),
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(color: HexColor(MyColors.primaryColor)),
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: AppConstants.index,
          unselectedFontSize: 10,
          selectedFontSize: 12,
          onTap: (int index) async {
           setState(() {
             AppConstants.index = index;
           });
            // _navigateToScreens(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              backgroundColor: Colors.white,
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              backgroundColor: Colors.white,
              label: "My History",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
              ),
              backgroundColor: Colors.white,
              label: "Wallet",
            ),
          ],
        ),
        body: showScreens(AppConstants.index),
      ),
    );




  }

  showScreens(int index) {
    switch (index) {
      case 0:
        return HomeTab();
      case 1:
        return HistoryTab();
      case 2:
        return WalletTab();
    }
  }
}
