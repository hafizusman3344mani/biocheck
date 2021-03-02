import 'package:biocheck/common/ui_widgets/custom_button_with_gradient.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonPopup extends StatefulWidget {

  Widget body;
  double cornerRadius;
  double height;


  CommonPopup(this.body, this.cornerRadius,this.height);

  @override
  _CommonPopupState createState() => _CommonPopupState();
}

class _CommonPopupState extends State<CommonPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.85),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.cornerRadius),
        ),
        child: widget.body,
      ),
    );
  }
}
