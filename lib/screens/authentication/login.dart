import 'dart:async';

import 'package:biocheck/common/exception/error_type_enum.dart';
import 'package:biocheck/common/ui_widgets/autocompletetextview/flutter_typeahead.dart';
import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/ui_widgets/custominput.dart';
import 'package:biocheck/common/ui_widgets/custominput2.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/common_functions.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/animations/animation_controller.dart';
import 'package:biocheck/controllers/authentication/user_controller.dart';
import 'package:biocheck/controllers/infrastructure/common/extension.dart';
import 'package:biocheck/db/dao/user_dao.dart';
import 'package:biocheck/db/database/database_handler.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/db/repository/user_repo.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:biocheck/models/apimodels/franchise/franchise.dart';
import 'package:biocheck/models/local/result.dart';
import 'package:biocheck/screens/common/common_background_start_screen.dart';
import 'package:biocheck/screens/startup/start_info_pages.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'login_success_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var estbTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  List<Color> topGrdnt = AppColors.redGradien;
  var _opacity = 1.0;

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var estabFocusNode = new FocusNode();
  var emailFocusNode = new FocusNode();
  var passwordFocusNode = new FocusNode();
  var userController = UserController();
  var extension = Extensions();
  var user = User();
  int franchiseId = 0;

  AlignmentGeometry _alignmentIcon = Alignment.topCenter;
  AlignmentGeometry _alignmentCard = Alignment.center;

  var marginTopIcon = 20.0;
  var connectivityResult;

  Widget row(Franchise franchise) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          franchise.Name,
          style: TextStyle(fontSize: 16.0),
        )
      ],
    );
  }

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (visible) {
          topGrdnt = AppColors.welcomeButton;
          _alignmentCard = Alignment.topCenter;
          userController.updateUserBuilder();
        } else {
          topGrdnt = AppColors.redGradien;
          _alignmentCard = Alignment.center;
          userController.updateUserBuilder();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    // if (!isKeyboardVisible) {
    //   topGrdnt = AppColors.redGradien;
    //   _alignmentCard = Alignment.center;
    //   userController.updateUserBuilder();
    // } else {
    //   topGrdnt = AppColors.welcomeButton;
    //   _alignmentCard = Alignment.topCenter;
    //   userController.updateUserBuilder();
    // }
    return GetBuilder<UserController>(
      init: userController,
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: [
              Background(
                topColors: topGrdnt,
                isWelcome: false,
              ),
              AnimatedAlign(
                curve: Curves.ease,
                duration: Duration(milliseconds: 800),
                alignment: _alignmentCard,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  height: AppValue.screenHeight(context) / AppValue.cardHeight,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                      left: AppValue.horizontalMargin,
                      right: AppValue.horizontalMargin),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(5.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Stack(
                              children: [
                                AnimatedAlign(
                                  curve: Curves.ease,
                                  duration: Duration(milliseconds: 800),
                                  alignment: _alignmentIcon,
                                  onEnd: () {
                                    Navigator.pushReplacement(
                                      context,
                                      RoutePage(
                                        builder: (context) {
                                          return LoginSuccess();
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: marginTopIcon),
                                    child: GetIcon(
                                      height: 30.0,
                                      width: 24.0,
                                      path: GlobalResources.ic_shield_check,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0.0,
                                  right: 0.0,
                                  top: 70.0,
                                  bottom: 20.0,
                                  child: SingleChildScrollView(
                                    child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 400),
                                      opacity: _opacity,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: AppValue.horizontalMargin,
                                          right: AppValue.horizontalMargin,
                                        ),
                                        height: 367.0,
                                        padding: EdgeInsets.only(bottom: 20.0),
                                        child: Form(
                                          key: _key,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // GetBuilder<Extensions>(
                                              //   init: extension,
                                              //   builder: (controller) {
                                              //     return Column(
                                              //       crossAxisAlignment:
                                              //       CrossAxisAlignment.start,
                                              //       children: [
                                              //         TypeAheadField(
                                              //
                                              //           textFieldConfiguration:
                                              //           TextFieldConfiguration(
                                              //             focusNode: estabFocusNode,
                                              //             onChanged: (value) {
                                              //               franchiseId = 0;
                                              //             },
                                              //             controller:
                                              //             estbTextController,
                                              //             autofocus: false,
                                              //             style: WidgetProps
                                              //                 .textStyleInputFiled,
                                              //             decoration: InputDecoration(
                                              //               hintText: S
                                              //                   .of(context)
                                              //                   .loginHintEstablishment,
                                              //               hintStyle: TextStyle(
                                              //                   color: AppColors
                                              //                       .welcomeTextColor
                                              //                       .withOpacity(
                                              //                       0.5)),
                                              //               enabledBorder:
                                              //               OutlineInputBorder(
                                              //                 borderSide: BorderSide(
                                              //                     color: _
                                              //                         .validityEstablishment
                                              //                         .message ==
                                              //                         null ||
                                              //                         _
                                              //                             .validityEstablishment
                                              //                             .message
                                              //                             .isEmpty
                                              //                         ? Colors.grey
                                              //                         .shade400
                                              //                         : AppColors
                                              //                         .themeRedColor),
                                              //               ),
                                              //               border:
                                              //               OutlineInputBorder(
                                              //                 borderSide: BorderSide(
                                              //                     color: _
                                              //                         .validityEstablishment
                                              //                         .message ==
                                              //                         null ||
                                              //                         _
                                              //                             .validityEstablishment
                                              //                             .message
                                              //                             .isEmpty
                                              //                         ? Colors.grey
                                              //                         .shade400
                                              //                         : AppColors
                                              //                         .themeRedColor),
                                              //               ),
                                              //               focusedBorder:
                                              //               OutlineInputBorder(
                                              //                 borderSide: BorderSide(
                                              //                     color: _
                                              //                         .validityEstablishment
                                              //                         .message ==
                                              //                         null ||
                                              //                         _
                                              //                             .validityEstablishment
                                              //                             .message
                                              //                             .isEmpty
                                              //                         ? Colors.grey
                                              //                         .shade400
                                              //                         : AppColors
                                              //                         .themeRedColor),
                                              //               ),
                                              //               counter: Offstage(),
                                              //             ),
                                              //           ),
                                              //           suggestionsCallback:
                                              //               (pattern) async {
                                              //             return extension
                                              //                 .franchises
                                              //                 .where((element) =>
                                              //                 element.Name
                                              //                     .isCaseInsensitiveContains(
                                              //                     pattern));
                                              //           },
                                              //           itemBuilder:
                                              //               (context, suggestion) {
                                              //             return ListTile(
                                              //               title:
                                              //               Text(suggestion.Name),
                                              //             );
                                              //           },
                                              //           hideOnEmpty: true,
                                              //           onSuggestionSelected:
                                              //               (suggestion) {
                                              //             franchiseId = suggestion
                                              //                 .Id;
                                              //             estbTextController.text =
                                              //                 suggestion.Name;
                                              //             userController
                                              //                 .checkEstablishment(
                                              //                 suggestion.Name);
                                              //           },
                                              //         ),
                                              //         Container(
                                              //           padding: EdgeInsets.only(
                                              //               top: 0.0, left: 3.0),
                                              //           child: Text(
                                              //             _.validityEstablishment
                                              //                 .message ??
                                              //                 '',
                                              //             style: TextStyle(
                                              //                 color: AppColors
                                              //                     .themeRedColor,
                                              //                 fontSize: 11.0,
                                              //                 fontWeight:
                                              //                 FontWeight.w300),
                                              //           ),
                                              //         )
                                              //       ],
                                              //     );
                                              //   },
                                              // ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 5.0),
                                                child: EditTextOutline(
                                                  error:
                                                      _.validityEmail.message ??
                                                          '',
                                                  hint: S
                                                      .of(context)
                                                      .loginHintEmail,
                                                  focusNode: emailFocusNode,
                                                  maxLength: 25,
                                                  myController:
                                                      emailTextController,
                                                  formatter:
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                    RegExp(
                                                        "[A-Z a-z _ . @ 0-9]"),
                                                  ),
                                                  obsecureText: false,
                                                  onSaved: (String value) {
                                                    userController
                                                        .checkEmail(value);
                                                  },
                                                  validator: (value) {
                                                    return "";
                                                  },
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 5.0),
                                                child: EditTextPassword(
                                                  error: _.validityPassword
                                                          .message ??
                                                      '',
                                                  hint: S
                                                      .of(context)
                                                      .loginHintWachtwoord,
                                                  focusNode: passwordFocusNode,
                                                  maxLength: 25,
                                                  myController:
                                                      passwordTextController,
                                                  obsecureText: true,
                                                  onSaved: (String value) {
                                                    userController
                                                        .checkPassword(value);
                                                  },
                                                  onSubmit: (String val) {
                                                    validateUser(context);
                                                  },
                                                  validator: (value) {
                                                    return "";
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15.0,
                                                    top: 5.0),
                                                child: Textview(
                                                    S
                                                        .of(context)
                                                        .loginForgotPassword,
                                                    13.0,
                                                    FontWeight.w600,
                                                    AppColors.noAccTextColor,
                                                    TextAlign.center),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.0,
                                                      right: 15.0,
                                                      top: 10.0),
                                                  child: HeroButton(
                                                    width: AppValue.screenWidth(
                                                        context),
                                                    height: AppValue
                                                        .customButtonHeight,
                                                    title: S
                                                        .of(context)
                                                        .loginButtonTitle,
                                                    gradient: WidgetProps
                                                        .getAppGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors:
                                                          AppColors.loginButton,
                                                    ),
                                                    onPressed: () =>
                                                        validateUser(context),
                                                    radius: AppValue
                                                        .customButtonRadius,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  validateUser(BuildContext context) async {
    //user.franchiseId = franchiseId;
    user.establishment = estbTextController.text;
    user.username = emailTextController.text;
    user.password = passwordTextController.text;

    connectivityResult = await (Connectivity().checkConnectivity());

    if (!userController.checkUserValidations(user)) {
      userController.updateUserBuilder();
    } else {
      FocusScope.of(context).unfocus();
      Timer(Duration(milliseconds: 900), () {
        callApi(context);
      });
    }
  }

  callApi(BuildContext context) async {
    if (connectivityResult != ConnectivityResult.none) {
      // I am connected to a mobile network.
      Result result = await userController.validateUser(user);
      if (result.code == ErrorType.Success) {
        topGrdnt = AppColors.parrotGreen;
        _opacity = 0.0;
        _alignmentIcon = Alignment.center;
        marginTopIcon = 0.0;
        userController.updateUserBuilder();
      } else {
        CommonFunctions.ShowPopup(context, result.commonMessage);
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: new Text(
          'No internet',
          textAlign: TextAlign.center,
        ),
      ));
    }
  }
}
