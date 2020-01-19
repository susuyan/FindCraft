class SignAccountModel {
  int id;
  String userPhone;
  String userPwd;
  String lastModifyData;
  String dataJoined;

  SignAccountModel(
      {this.id,
      this.userPhone,
      this.userPwd,
      this.lastModifyData,
      this.dataJoined});

  SignAccountModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    id = json['id'];
    userPhone = json['user_phone'];
    userPwd = json['user_pwd'];
    lastModifyData = json['last_modify_data'];
    dataJoined = json['data_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_phone'] = this.userPhone;
    data['user_pwd'] = this.userPwd;
    data['last_modify_data'] = this.lastModifyData;
    data['data_joined'] = this.dataJoined;
    return data;
  }
}


class UsersInfoModel {
  int code;
  String msg;
  List<SignAccountModel> data;

  UsersInfoModel({this.code, this.msg, this.data});

  UsersInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<SignAccountModel>();
      json['data'].forEach((v) {
        data.add(new SignAccountModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}