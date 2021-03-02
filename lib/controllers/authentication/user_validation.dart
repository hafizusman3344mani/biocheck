import 'package:biocheck/common/models/validity_model.dart';
import 'package:biocheck/controllers/infrastructure/common/extension.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:get/get.dart';

class UserValidation {
  static ValidityModel validateUserEmail(String value) {
    var model = ValidityModel();
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (value.isNullOrBlank) {
      model.message = S.of(Get.context).ErrorRequired;
      model.valid = false;
    } else if (!emailValid) {
      model.message = S.of(Get.context).ErrorEmailInvalid;
      model.valid = false;
    } else {
      model.message = '';
      model.valid = true;
    }
    return model;
  }

  static ValidityModel validateUserPassword(String value) {
    var model = ValidityModel();
    if (value.isNullOrBlank) {
      model.message = S.of(Get.context).ErrorRequired;
      model.valid = false;
    } else if (value.length.isLowerThan(6) || value.length.isGreaterThan(15)) {
      model.message = S.of(Get.context).ErrorPasswordLength;
      model.valid = false;
    } else {
      model.message = '';
      model.valid = true;
    }
    return model;
  }

  static ValidityModel validateEstablishment(String value) {
    var model = ValidityModel();
    if (value.isNullOrBlank) {
      model.message = S.of(Get.context).ErrorRequired;
      model.valid = false;
    } else {
      model.message = '';
      model.valid = true;
    }
    return model;
  }

  static ValidityModel validateFranchise(String value, Extensions extensions) {
    var model = ValidityModel();

    if (extensions.franchises
            .where((element) => element.Name == value)
            .toList()
            .length >
        0) {
      model.message = '';
      model.valid = true;
    } else {
      model.message = S.of(Get.context).ErrorFranchise;
      model.valid = false;
    }
    return model;
  }
}
