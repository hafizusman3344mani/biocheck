import 'dart:io';

import 'package:biocheck/common/exception/error_type_enum.dart';
import 'package:biocheck/models/apimodels/common_message.dart';
import 'package:biocheck/models/local/result.dart';
import 'package:dio/dio.dart';

import 'exception_codes_messages.dart';

class ExceptionHandler {
  static Result onError(Object o) {
    if (o is DioError) {
      return _handleDioError(o);
    } else {
      return _unknownException();
    }
  }

  static Result _handleDioError(DioError error) {
    var result = Result();
    var err = CommonMessage();
    if (error.error is SocketException) {
      result.code = error.error.osError.errorCode;
      result.message = Exceptions.NO_INTERNET;
      err.Message = Exceptions.NO_INTERNET;
      err.Type = 1;
      result.commonMessage = err;
    } else if (error.error == HttpException) {
      result.code = Exceptions.UNATHORIZED_CODE;
      result.message = Exceptions.UNATHORIZED_MESSAGE;
    } else {
      result.code = error.response.statusCode;
      result.message = error.response.statusMessage;
    }
    return result;
  }

  static Result _unknownException() {
    var result = Result();
    result.code = Exceptions.UNKNOWN;
    result.message = Exceptions.UNKNOWN_MESSAGE;
    return result;
  }

  static CommonMessage onApiError(List<CommonMessage> errors) {
    var result = CommonMessage();

    errors.forEach((element) {
      if (element.Type == ErrorType.Error) {
        result = element;
      }
    });

    return result;
  }
}
