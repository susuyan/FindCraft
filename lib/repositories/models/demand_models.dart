class DemandModel {
  int id;
  int userId;
  String title;
  String content;
  String address;
  String city;
  String type01;
  String type02;
  String type03;
  String type04;
  String createData;
  String changeData;
  String userPhone;
  String userWechat;
  String userName;

  DemandModel(
      {this.id,
      this.userId,
      this.userName,
      this.title,
      this.content,
      this.address,
      this.city,
      this.type01,
      this.type02,
      this.type03,
      this.type04,
      this.createData,
      this.changeData,
      this.userPhone,
      this.userWechat});

  DemandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
    address = json['address'];
    city = json['city'];
    type01 = json['type01'];
    type02 = json['type02'];
    type03 = json['type03'];
    type04 = json['type04'];
    createData = json['create_data'];
    changeData = json['change_data'];
    userPhone = json['user_phone'];
    userWechat = json['user_wechat'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['address'] = this.address;
    data['city'] = this.city;
    data['type01'] = this.type01;
    data['type02'] = this.type02;
    data['type03'] = this.type03;
    data['type04'] = this.type04;
    data['create_data'] = this.createData;
    data['change_data'] = this.changeData;
    data['user_phone'] = this.userPhone;
    data['user_wechat'] = this.userWechat;
    data['user_name'] = this.userName;
    return data;
  }
}
