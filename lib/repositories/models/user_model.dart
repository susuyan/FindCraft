class UserModel {
  String token;
  String userPhone;

  UserModel({this.token, this.userPhone});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userPhone = json['user_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_phone'] = this.userPhone;
    return data;
  }
}