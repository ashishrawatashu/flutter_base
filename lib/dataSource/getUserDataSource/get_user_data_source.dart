import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_base/dataSource/getUserDataSource/get_user_api.dart';

import '../../Utils/networkmodel/APIHandler.dart';
import '../../Utils/networkmodel/APIs.dart';

class GetUserDataSource implements GetUserApi {
  @override
  Future getUserApi() async {
    Map<String, String> requestBody = Map();
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.get(
        url: "${APIs.users}",
        requestBody: null,);
    completer.complete(response);
    return completer.future;
  }
}