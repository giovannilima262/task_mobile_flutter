import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/core/start/app_module.dart';
import 'package:task_mobile_giovanni/features/login/login_page.dart';

final AppModule appModule = AppModule();
void main() {
  runApp(
    ModularApp(
      module: appModule,
      child: const MaterialApp(
        home: LoginPage(),
      ),
    ),
  );
}

Future<void> validated() async {
  runApp(
    ModularApp(
      module: appModule,
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
