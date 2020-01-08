class HomeOrderModels {
  List<HomeOrderModel> data;

  HomeOrderModels({this.data});

  HomeOrderModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<HomeOrderModel>();
      json['data'].forEach((v) {
        data.add(new HomeOrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeOrderModel {
  String city;
  int id;
  String type01;
  Null type02;
  Null type03;
  Null type04;
  String typecode;
  int userId;
  String userName;
  String userWechat;

  HomeOrderModel(
      {this.city,
      this.id,
      this.type01,
      this.type02,
      this.type03,
      this.type04,
      this.typecode,
      this.userId,
      this.userName,
      this.userWechat});

  HomeOrderModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    id = json['id'];
    type01 = json['type01'];
    type02 = json['type02'];
    type03 = json['type03'];
    type04 = json['type04'];
    typecode = json['typecode'];
    userId = json['user_id'];
    userName = json['user_name'];
    userWechat = json['user_wechat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['id'] = this.id;
    data['type01'] = this.type01;
    data['type02'] = this.type02;
    data['type03'] = this.type03;
    data['type04'] = this.type04;
    data['typecode'] = this.typecode;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_wechat'] = this.userWechat;
    return data;
  }
}
