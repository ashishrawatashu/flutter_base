import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/Screens/dash_board.dart';

import 'Screens/splash_screen.dart';
import 'Utils/colors_code.dart';
import 'Utils/hex_color.dart';
import 'Utils/my_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        color: HexColor(MyColors.primaryColor),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColorDark: HexColor(MyColors.primaryColor),
            primaryColor: HexColor(MyColors.primaryColor)),
        initialRoute: MyRoutes.splashScreen,
        routes: {
          MyRoutes.splashScreen: (context) => const SplashScreen(),
          MyRoutes.dashBoard: (context) => const DashBoard(),
        });
  }
}
