import 'package:biocheck/common/models/validity_model.dart';
import 'package:biocheck/common/utils/common_functions.dart';
import 'package:biocheck/controllers/authentication/user_validation.dart';
import 'package:biocheck/controllers/infrastructure/common/extension.dart';
import 'package:biocheck/controllers/infrastructure/core/api_controller.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:biocheck/models/local/result.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var apiController = ApiController();
  var userResult = Result().obs;

  var validityEmail = ValidityModel();
  var validityPassword = ValidityModel();
  var validityEstablishment = ValidityModel();

  Future<Result> validateUser(User user) async {
    CommonFunctions.showLoader();
    Result result = await apiController.validateUserApi(user);
    CommonFunctions.closeLoader();
    return result;
    //userResult.value = result;
    // updateUserBuilder();
  }

  checkEmail(String email) {
    validityEmail = UserValidation.validateUserEmail(email);
    updateUserBuilder();
  }
  checkPassword(String password) {
    validityPassword = UserValidation.validateUserPassword(password);
    updateUserBuilder();
  }
  checkEstablishment(String est) {
    validityEstablishment = UserValidation.validateEstablishment(est);
    updateUserBuilder();
  }

  bool checkUserValidations(User user)
  {
   // validityEstablishment = UserValidation.validateEstablishment(user.establishment);
    //validityEstablishment = UserValidation.validateFranchise(user.establishment,Get.find<Extensions>());
    validityEmail = UserValidation.validateUserEmail(user.username);
    validityPassword = UserValidation.validateUserPassword(user.password);

    return validityEmail.valid && validityPassword.valid ;
    return validityEmail.valid && validityPassword.valid && validityEstablishment.valid;
  }

  updateUserBuilder() {
    update();
  }
}
