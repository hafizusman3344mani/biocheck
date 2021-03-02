import 'dart:convert';

import 'package:biocheck/common/exception/error_type_enum.dart';
import 'package:biocheck/common/exception/exception_codes_messages.dart';
import 'package:biocheck/common/exception/exception_handler.dart';
import 'package:biocheck/db/dao/user_dao.dart';
import 'package:biocheck/db/database/database_handler.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/db/repository/user_repo.dart';
import 'package:biocheck/models/apimodels/authorization/authorization_response.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:biocheck/models/apimodels/common_message.dart';
import 'package:biocheck/models/apimodels/franchise/franchise.dart';
import 'package:biocheck/models/apimodels/franchise/franchise_response.dart';
import 'package:biocheck/models/local/result.dart';
import 'package:biocheck/service/restapiservice/rest_client_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  ////region Common

  Future<Result> getFranchise() async {
    var res = Result();
    try {
      RestClientApi api = RestClientApi(Dio());
      var response = await api.getFranchises();
      if (!response.HasErrors) {
        List<Franchise> franchises = (response.Result as List)
            .map((element) => Franchise.fromJson(element))
            .toList();
        res.code = ErrorType.Success;
        res.message = Exceptions.SUCCESS_MESSAGE;
        res.body = franchises;
      } else {
        CommonMessage error = ExceptionHandler.onApiError(response.Messages);
        res.commonMessage = error;
        res.code = error.Type;
        res.message = error.Message;
        res.body = response.Messages;
      }
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }
  //endregion

  //region User
  Future<Result> validateUserApi(User user) async {
    //user.franchiseId = -1;
    user.username = "pvluijk@gmail.com";
    user.password = "G@sHo0d2021Today!";
    var res = Result();
    try {
      RestClientApi api = RestClientApi(Dio());
      var response = await api.validateUser(user);
      if (!response.HasErrors) {
        var userResponse = AuthorizationResponse.fromJson(response.Result);
        ///insert into DB
        await UserRepo.instance.mapUser(userResponse);
        //
        res.code = ErrorType.Success;
        res.message = Exceptions.SUCCESS_MESSAGE;
        res.body = userResponse;
      } else {
        CommonMessage error = ExceptionHandler.onApiError(response.Messages);
        res.commonMessage = error;
        res.code = error.Type;
        res.message = error.Message;
        res.body = response.Messages;
      }
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }
//endregion

}
