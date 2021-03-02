import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right:10.0,bottom: 10.0,top: 10.0),
      child: SvgPicture.asset(GlobalResources.logoPath,height: 27.0,width: 27.0,color: AppColors.themeRedColorMode,),
    );
  }
}
