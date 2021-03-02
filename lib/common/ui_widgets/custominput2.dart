import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTextPassword extends StatelessWidget {
  final IconData iconSuffix;
  final String hint;
  final String error;
  final Function onSaved;
  final Function onPressed;
  final Function onSubmit;
  final int maxLength;
  final bool obsecureText;
  final FormFieldValidator<String> validator;
  final TextEditingController myController;
  final FocusNode focusNode;

  EditTextPassword(
      {this.iconSuffix,
      this.hint,
      this.error,
      this.onPressed,
      this.onSaved,
      this.onSubmit,
      this.validator,
      this.obsecureText,
      this.maxLength,
      this.myController,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: focusNode,
          controller: myController,
          maxLength: maxLength,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          maxLines: 1,
          style: WidgetProps.textStyleInputFiled,
          onSaved: onSaved,
          onChanged: onSaved,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter(RegExp("[a-z A-Z 0-9]"))
          ],
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: AppColors.welcomeTextColor.withOpacity(0.5)),
            counter: Offstage(),
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
          ),
          obscureText: obsecureText,
          onFieldSubmitted: onSubmit,
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
