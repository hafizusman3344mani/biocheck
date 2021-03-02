import 'package:biocheck/common/exception/error_type_enum.dart';
import 'package:biocheck/models/apimodels/common_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'loader.dart';

class CommonFunctions {
  static ShowPopup(BuildContext context, CommonMessage error) {
    Alert(
      context: context,
      type: _getErrorType(error.Type),
      title: '',
      //error.TypeDescription,
      desc: error.Message,
      buttons: [
      ],
    ).show();
  }

  static showLoader() {
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Loader(),
        );
      },
    );
  }

  static closeLoader() {
    Get.back(canPop: true);
  }

  static AlertType _getErrorType(int type) {
    if (type == ErrorType.Error) {
      return AlertType.error;
    } else if (type == ErrorType.Success) {
      return AlertType.success;
    } else if (type == ErrorType.Info) {
      return AlertType.info;
    } else if (type == ErrorType.Warning) {
      return AlertType.warning;
    } else {
      return AlertType.none;
    }
  }
}
