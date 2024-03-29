import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/features/login/login_controller.dart';
import 'package:task_mobile_giovanni/main.dart';
import 'package:task_mobile_giovanni/widgets/loading.dart';
import 'package:task_mobile_giovanni/widgets/refresh_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    this.loginController,
  });

  final LoginController? loginController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String title = "Login";
  late LoginController loginControllerLocal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginControllerLocal =
        widget.loginController ?? Modular.get<LoginController>();

    refresh();
  }

  Future<void> refresh() async {
    try {
      await Modular.get<LoginController>().validLogin(
          email: "admin@admin", // email test
          password: "admin" // password test
          );
    } catch (e) {
      // TODO Log
    }
    validated();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return loginControllerLocal.loading
            ? const Loading()
            : RefreshPage(
                onPressed: () {
                  refresh();
                },
              );
      },
    );
  }
}
