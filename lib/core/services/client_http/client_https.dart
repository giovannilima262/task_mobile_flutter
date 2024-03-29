import 'package:dio/dio.dart';
import 'package:task_mobile_giovanni/core/services/client_http/base/base_string_helper.dart';
import 'package:task_mobile_giovanni/core/services/client_http/base/client_base_impl.dart';
import 'package:task_mobile_giovanni/core/services/client_http/interceptors/loggers_interceptors.dart';

class ClientHttps extends ClientBaseImpl {
  ClientHttps()
      : super(
          BaseOptions(
            baseUrl: BaseStringHelper.staging().fullUrl,
            sendTimeout: BaseStringHelper.staging().timeout,
            connectTimeout: BaseStringHelper.staging().timeout,
            receiveTimeout: BaseStringHelper.staging().timeout,
            contentType: BaseStringHelper.staging().contentType,
          ),
          interceptors: [LoggersInterceptors()],
        );
}
