import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:task_mobile_giovanni/features/login/login_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  LoginControllerBase({
    this.loginService,
  }) {
    loginService = loginService ?? Modular.get<LoginService>();
  }

  LoginService? loginService;

  @observable
  bool loading = true;

  @action
  Future<void> validLogin({
    required String email,
    required String password,
  }) async {
    try {
      if (loading) return;
      loading = true;
      await loginService!.validLogin(
        email: email,
        password: password,
      );
      Modular.to.navigate("/task");
    } catch (_) {
      rethrow;
    } finally {
      loading = false;
    }
  }
}
