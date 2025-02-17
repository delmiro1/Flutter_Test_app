import '../dal/login_dal.dart';
import '../models/user_model.dart';

class LoginController {
  Future<UserModel> login(String email, String password) async {
    LoginDal dal = LoginDal();
    return dal.login(email, password);
  }
}