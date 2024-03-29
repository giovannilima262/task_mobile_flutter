import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_mobile_giovanni/core/services/client_http/client_https.dart';

class LoginRepository {
  LoginRepository({
    this.clientHttps,
  }) {
    clientHttps = clientHttps ?? Modular.get<ClientHttps>();
  }

  ClientHttps? clientHttps;

  Future<String?> validLogin(String email, String password) async {
    try {
      String endpoint = 'login';
      final result = await clientHttps!.post(
        endpoint,
        data: {
          'email': email,
          'password': password,
          'device_name': 'mobile',
        },
      );

      return result.data['token'];
    } catch (_) {
      rethrow;
    }
  }
}
