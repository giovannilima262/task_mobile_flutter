import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/core/services/client_http/client_https.dart';
import 'package:task_mobile_giovanni/features/login/login_controller.dart';
import 'package:task_mobile_giovanni/features/login/login_repository.dart';
import 'package:task_mobile_giovanni/features/login/login_service.dart';
import 'package:task_mobile_giovanni/features/task/task_controller.dart';
import 'package:task_mobile_giovanni/features/task/task_repository.dart';
import 'package:task_mobile_giovanni/features/task/task_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    // Controller
    i.addSingleton(LoginController.new);
    i.addSingleton(TaskController.new);

    // Service
    i.addSingleton(LoginService.new);
    i.addSingleton(TaskService.new);

    // Repository
    i.addSingleton(LoginRepository.new);
    i.addSingleton(TaskRepository.new);

    // Https
    i.addSingleton(ClientHttps.new);
  }
}
