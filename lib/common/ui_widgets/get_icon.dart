import 'package:biocheck/common/ui_widgets/faded_widget2.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetIcon extends StatelessWidget {
  String path;
  double width;
  double height;
  Color color;

  GetIcon({this.path, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        path,
        width:width,
        height: height,
        color: color,
    );
  }
}

class GetImage extends StatelessWidget {
  String path;
  double width;
  double height;
  Color color;

  GetImage({this.path, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: BoxFit.fill,
      width:width,
      height: height,
      color: color,
    );
  }
}
