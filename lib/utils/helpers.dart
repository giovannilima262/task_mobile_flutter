import 'package:task_mobile_giovanni/utils/constants.dart';

class Helpers {
  static String? textValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return Constants.requiredFieldValidation;
    }

    return null;
  }
}
