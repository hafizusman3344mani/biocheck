import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/bottom_bar_item.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/connection_controller.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/dashboard/configuration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:biocheck/models/local/bluetooth/bluetooth_model.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SetBeltName extends StatefulWidget {
  BluetoothDevice bluetoothModel;

  SetBeltName(this.bluetoothModel);

  @override
  _SetBeltNameState createState() => _SetBeltNameState();
}

class _SetBeltNameState extends State<SetBeltName> {
  var focusNode = FocusNode();
  var nameController = TextEditingController();
  var controllerConnections = Get.find<ConnectionController>();

  var hrController = Get.find<HRController>();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent.withOpacity(0.65),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          height: 170,
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 22.0, right: 22.0),
                      child: Textview(
                          S.of(context).setBeltPopupTitle,
                          12.0,
                          FontWeight.w300,
                          AppColors.dashboardTextColor,
                          TextAlign.start),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppValue.screenWidth(context) / 1.7,
                margin: EdgeInsets.only(left: 22.0, right: 22.0),
                height: 45.0,
                child: TextFormField(
                  focusNode: focusNode,
                  textAlign: TextAlign.left,
                  style: WidgetProps.textStyleInputFiled,
                  decoration: InputDecoration(
                    counter: Offstage(),
                  ),
                  obscureText: false,
                  maxLength: 25,
                  validator: (value) {},
                  controller: nameController,
                  onSaved: (newValue) {},
                ),
              ),
              GestureDetector(
                onTap: () {
                  setDeviceAndNext();
                },
                child: Container(
                  height: 55.0,
                  decoration: BoxDecoration(
                    gradient: WidgetProps.getAppGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.parrotGreen,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      GetIcon(
                        height: 25.0,
                        width: 25.0,
                        path: GlobalResources.ic_check,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  setDeviceAndNext() async {
    hrController.currentDevice = widget.bluetoothModel;
    var connection = Connection.fromConnection();
    connection.ConnectedDeviceName = widget.bluetoothModel.name;
    connection.ConnectedUserDeviceName = nameController.text;
    connection.isConnected = false;
    connection.ConnectionId = widget.bluetoothModel.id.toString();
    connection.ConnetionSdk = Constants.POLARTYPE;
    await ConnectionRepo.instance.deleteConnection();
    await ConnectionRepo.instance.mapConnection(connection);
    controllerConnections.connection = connection ;
    Navigator.of(context).pop();
    Navigator.pushReplacement(context, RoutePage(
      builder: (context) {
        return BeltConfiguration();
      },
    ));
  }
}
