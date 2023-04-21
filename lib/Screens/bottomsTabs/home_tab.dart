import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/Utils/navdrawer.dart';
import 'package:flutter_base/dataSource/getUserDataSource/get_user_data_source.dart';

import '../../response/users_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {



  bool isLoading = true;

  List<Data>? userList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        color: Colors.white,
        child: showList(),
      ),
    );

  }
  showList() {
    if(isLoading){
      return Center(
        child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            // Dialog background
            width: 50, // Dialog width
            height: 50, // Dialog height
            child: CircularProgressIndicator(
              color: Colors.green,
            )),
      );
    }else {
      return  ListView.builder(
        shrinkWrap: true,
        itemCount: userList!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 35,
                  child: Text(userList![0].firstName.toString()+"  "+userList![0].lastName.toString()),
                ),
              ),
              Container(
                height: 1,
                color: Colors.black,
              )
            ],
          );
        },
      );
    }


  }

  Future<void> getUsers() async {
    UsersModel usersModel = new UsersModel();
    GetUserDataSource getUserDataSource = GetUserDataSource();
    var response = await getUserDataSource.getUserApi();
    usersModel = UsersModel.fromJson(response);
    setState(() {
      userList = usersModel.data;
      isLoading = false;
    });
  }
}
