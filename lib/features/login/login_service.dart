import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/features/login/login_repository.dart';

class LoginService {
  LoginService({
    this.loginRepository,
  }) {
    loginRepository = loginRepository ?? Modular.get<LoginRepository>();
  }

  LoginRepository? loginRepository;

  String? token;

  bool isLogged() => token != null && token!.isNotEmpty;

  Future<bool> validLogin({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) return Future.value(false);
    try {
      token = await loginRepository!.validLogin(email, password);
      return isLogged();
    } catch (_) {
      rethrow;
    } finally {}
  }
}
