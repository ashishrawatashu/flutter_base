import '../Screens/bottomsTabs/history_tab.dart';
import '../Screens/bottomsTabs/home_tab.dart';
import '../Screens/bottomsTabs/wallet_tab.dart';

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