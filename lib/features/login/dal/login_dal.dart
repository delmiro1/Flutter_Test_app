import '../models/user_model.dart';

class LoginDal {
  Future<UserModel> login(String email, String password) async {
    if (email.trim().isEmpty) {
      throw Exception("Email is required");
    }
    if (password.trim().isEmpty) {
      throw Exception("Password is required");
    }

    if (email == "test@test.com" && password == "password") {
      return UserModel(email: email, password: password, id: "1");
    } else {
      throw Exception("No user found");
    }
  }
}
