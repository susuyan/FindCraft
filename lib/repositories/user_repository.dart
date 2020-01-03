import 'package:find_craft/repositories/models/user_model.dart';

class UserRepository {
  UserRepository({this.userModel});
  final UserModel userModel;

  hasToken() => userModel.token.isNotEmpty;
}
