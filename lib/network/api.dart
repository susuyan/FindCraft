import 'package:flutter/material.dart';

class API {
  API(this.path, {this.params});

  final APIPath path;

  final Map<String, dynamic> params;

  // static const base = 'http://zhaogegong.beituokj.com/api/';
  static const base = 'http://127.0.0.1:8000/api/';
  // static const base =
  //     'https://fd0adb60-cda8-4ca5-bd84-84379e5402e0.mock.pstmn.io';

  // 登录
  static const login = APIPath('/login/', name: 'login');
  // 注册
  static const sign = APIPath('/create/', name: 'sign');
  // 选择身份
  static const signInfo = APIPath('/role/', name: 'signInfo');
  // 发布需求
  static const publishDemand = APIPath('/listrelease/', name: 'publishDemand');

  // 首页师傅
  static const homeCraft = APIPath('/masterworker/', name: 'homeCraft');
  // 首页业主
  static const homeOrder = APIPath('/employer/', name: 'homeOrder');
  // 师傅列表
  static const craftList = APIPath('/worker/', name: 'craftList');
  // 业主列表
  static const orderList = APIPath('/listrelease/', name: 'orderList');
  // 师傅详情
  static const craftDetails = APIPath('/workerinfo/', name: 'craftDetails');

  // 需求列表
  static const demandList = APIPath('/listrelease/', name: 'demandList');
  // 需求详情
  static const demandDetails = APIPath('/demandinfo/', name: 'demandDetails');

  // 我的
  static const mine = APIPath('/role', name: 'mine');
}

class APIPath {
  final String name;
  final String path;

  const APIPath(this.path, {this.name});
}
