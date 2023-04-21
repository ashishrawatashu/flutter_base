import 'package:flutter/material.dart';
import 'package:flutter_base/dataSource/userRegisterDataSource/user_register_data_source.dart';
import 'package:flutter_base/response/user_register_response.dart';

import '../../Utils/navdrawer.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {

  String id = "";
  String token = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text("History"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding:
                  MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              child: Text('     Register Here      '),
              onPressed: () {
                registerUser();
              },
            ),

            SizedBox(height: 30,),
            Row(
              children: [
                Text("Name :"),
                Text(id)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Email :"),
                Text(token),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserRegisterResponse userRegisterResponse  = UserRegisterResponse();
    UserRegisterDataSource userRegisterDataSource = UserRegisterDataSource();
    var response = await userRegisterDataSource.userRegisterApi("eve.holt@reqres.in", "pistol");
    userRegisterResponse = UserRegisterResponse.fromJson(response);
    setState(() {
      id = userRegisterResponse.id.toString();
      token = userRegisterResponse.token.toString();
    });

  }
}
