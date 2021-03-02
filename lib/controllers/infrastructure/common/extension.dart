import 'package:biocheck/common/exception/error_type_enum.dart';
import 'package:biocheck/controllers/infrastructure/core/api_controller.dart';
import 'package:biocheck/models/apimodels/franchise/franchise.dart';
import 'package:biocheck/models/local/result.dart';
import 'package:get/get.dart';

class Extensions extends GetxController {
  var apiController = ApiController();
  var franchises = List<Franchise>();

  Extensions() {
    getFranchises();
  }

  void getFranchises() async {
    Result result = await apiController.getFranchise();
    if (result.code == ErrorType.Success) {
      franchises = result.body;
    }
    franchises;
    updateExtensions();
  }

  updateExtensions() {
    update();
  }
}
