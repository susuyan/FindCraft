class API {
  API(this.path, {this.params});

  final String path;
  final Map<String, dynamic> params;

  // static const base = 'http://zhaogegong.beituokj.com/api';
  static const base =
      'https://fd0adb60-cda8-4ca5-bd84-84379e5402e0.mock.pstmn.io';

  // 登录
  static const login = '/login';
  // 注册
  static const sign = '/create';
  // 选择身份
  static const chooseIdentity = '/role';
  // 发布需求
  static const publishDemand = '/listrelease';

  // 首页师傅
  static const homeCraft = '/masterworker';
  // 首页业主
  static const homeOrder = '/employer';
  // 师傅列表
  static const craftList = '/worker';
  // 业主列表
  static const orderList = '/listrelease';
  // 师傅详情
  static const craftDetails = '/workerinfo';

  // 需求列表
  static const demandList = '/listrelease';
  // 需求详情
  static const demandDetails = '/demandinfo';



  // 我的
  static const mine = '/role';

  // mock
  static final loginAPI =
      API(login, params: {'user_phone': '13581850764', 'user_pwd': '123'});

  static final homeCraftAPI =
      API(homeCraft, params: {'token': 'd538640ac68a5122855b04367f98f2b0'});
}
