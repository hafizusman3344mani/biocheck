import 'dart:math';

import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTextOutline extends StatelessWidget {
  final String hint;
  final String error;
  final Function onSaved;
  final bool obsecureText;
  final int maxLength;
  final FormFieldValidator<String> validator;
  final TextInputFormatter formatter;
  final TextEditingController myController;
  final FocusNode focusNode;

  EditTextOutline(
      {this.hint,
      this.error,
      this.onSaved,
      this.validator,
      this.formatter,
      this.obsecureText,
      this.maxLength,
      this.myController,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          focusNode: focusNode,
          textAlign: TextAlign.left,
          style: WidgetProps.textStyleInputFiled,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: AppColors.welcomeTextColor.withOpacity(0.5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error.isEmpty
                      ? Colors.grey.shade400
                      : AppColors.themeRedColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error.isEmpty
                      ? Colors.grey.shade400
                      : AppColors.themeRedColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: error.isEmpty
                      ? Colors.grey.shade400
                      : AppColors.themeRedColor),
            ),
            counter: Offstage(),
          ),
          obscureText: obsecureText,
          maxLength: maxLength,
          validator: validator,
          inputFormatters: <TextInputFormatter>[formatter],
          controller: myController,
          onSaved: onSaved,
          onChanged: onSaved,
          onEditingComplete: () => focusNode.nextFocus(),
        ),
        Container(
          padding: EdgeInsets.only(top: 0.0, left: 3.0),
          child: Text(
            error,
            style: TextStyle(
                color: AppColors.themeRedColor,
                fontSize: 11.0,
                fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
