class API {
  API(this.path, {this.params});

  final String path;
  final Map<String, dynamic> params;

  static const base = 'http://zhaogegong.beituokj.com/api/';

  static const homeCraft = '/masterworker';
  static const login = 'login/';
  static const sign = 'create/';
  static const employer = 'employer/';

  static final loginAPI =
      API(login, params: {'user_phone': '13581850764', 'user_pwd': '123'});

  static final homeCraftAPI =
      API(homeCraft, params: {'token': 'd538640ac68a5122855b04367f98f2b0'});
}
