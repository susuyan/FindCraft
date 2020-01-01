class API {
  API(this.path, {this.params});

  final String path;
  final Map<String, dynamic> params;

  static const base = 'http://zhaogegong.beituokj.com/api/';

  static const homeCraft = '/masterworker';
  static const login = 'login/';

  static final loginAPI =
      API(login, params: {'user_phone': '13581850764', 'user_pwd': '123'});

  static final homeCraftAPI =
      API(homeCraft, params: {'token': 'c3a1b67b485f659a7980ab9ade7fd096'});
}
