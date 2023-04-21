import 'dart:async';
import 'package:flutter_base/dataSource/userRegisterDataSource/user_register_api.dart';

import '../../Utils/networkmodel/APIHandler.dart';
import '../../Utils/networkmodel/APIs.dart';

class UserRegisterDataSource implements UserRegisterApi {

  @override
  Future userRegisterApi(String email, String password) async {
    Map<String, String> requestBody = Map();
    requestBody.putIfAbsent("email", () => email);
    requestBody.putIfAbsent("password", () => password);
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.post(
      url: "${APIs.register}",
      requestBody: requestBody,);
    completer.complete(response);
    return completer.future;
  }
}