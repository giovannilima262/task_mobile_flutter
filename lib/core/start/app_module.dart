import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/core/auth_guard.dart';
import 'package:task_mobile_giovanni/core/start/core_module.dart';
import 'package:task_mobile_giovanni/features/login/login_page.dart';
import 'package:task_mobile_giovanni/features/task/task_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const LoginPage(),
      transition: TransitionType.fadeIn,
    );
    r.child(
      '/task',
      child: (_) => const TaskPage(),
      transition: TransitionType.fadeIn,
      guards: [AuthGuard()],
    );
  }
}
