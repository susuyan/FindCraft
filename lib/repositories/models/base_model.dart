class BaseModel {
  int code;
  String msg;

  dynamic data;

  BaseModel({this.code, this.msg, this.data});

  BaseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}
