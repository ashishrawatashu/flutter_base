import 'package:flutter/material.dart';

import '../../Utils/navdrawer.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("Wallet"),),
      body: Center(
        child: Text("Wallet"),
      ),
    );
  }
}
