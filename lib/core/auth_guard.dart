import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/features/login/login_service.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: "/login");

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<LoginService>().isLogged();
  }
}
