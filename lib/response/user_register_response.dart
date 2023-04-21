class UserRegisterResponse {
  UserRegisterResponse({
      this.id, 
      this.token,});

  UserRegisterResponse.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
  }
  num? id;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    return map;
  }

}