import 'package:get/get.dart';

validator(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "value can't be Empty";
  }
  if (val.length < min) {
    return "value can't be less from $min";
  }
  if (val.length > max) {
    return "value can't bes large from $max";
  }

  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid Name";
    }
  }

  if (type == "nameAr") {
    final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    if (!arabicRegex.hasMatch(val)) {
      return "Not valid Arabic name";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone";
    }
  }
}
