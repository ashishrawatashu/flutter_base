import 'package:flutter/material.dart';
import 'package:flutter_base/Utils/show.dart';

import 'app_constants.dart';
import 'colors_code.dart';
import 'hex_color.dart';

class BottomNavBar extends StatefulWidget {
  Function(int) onTap;
  BottomNavBar({Key? key, required this.onTap,}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        widget.onTap(index);
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
    );
  }
}
