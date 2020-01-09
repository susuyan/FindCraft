class HomeCraftModels {
  List<HomeCraftModel> data;

  HomeCraftModels({this.data});

  HomeCraftModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<HomeCraftModel>();
      json['data'].forEach((v) {
        data.add(new HomeCraftModel.fromJson(v));
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

class HomeCraftModel {
  int id;
  int userId;
  String userName;
  String userWechat;
  String city;
  String type01;
  String type02;
  String type03;
  String type04;
  String typecode;

  HomeCraftModel(
      {this.id,
      this.userId,
      this.userName,
      this.userWechat,
      this.city,
      this.type01,
      this.type02,
      this.type03,
      this.type04,
      this.typecode});

  HomeCraftModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userWechat = json['user_wechat'];
    city = json['city'];
    type01 = json['type01'];
    type02 = json['type02'];
    type03 = json['type03'];
    type04 = json['type04'];
    typecode = json['typecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_wechat'] = this.userWechat;
    data['city'] = this.city;
    data['type01'] = this.type01;
    data['type02'] = this.type02;
    data['type03'] = this.type03;
    data['type04'] = this.type04;
    data['typecode'] = this.typecode;
    return data;
  }
}
