import 'package:task_mobile_giovanni/utils/constants.dart';

class BaseStringHelper {
  final String baseUrl;
  final String protocol;
  final String contentType;
  final Duration timeout;

  BaseStringHelper({
    this.baseUrl = "#",
    this.protocol = "https",
    this.contentType = "application/json",
    this.timeout = const Duration(seconds: 20),
  });

  factory BaseStringHelper.staging() {
    const staging = Constants.baseUrlApi;
    return BaseStringHelper(baseUrl: staging);
  }

  String get fullUrl => "$protocol://$baseUrl";
}
