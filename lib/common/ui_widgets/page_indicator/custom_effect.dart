import 'package:biocheck/common/ui_widgets/page_indicator/indicator_painter.dart';
import 'package:biocheck/common/ui_widgets/page_indicator/rectangle_painter.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:flutter/material.dart';

import 'indicator_effect.dart';

class BubbleEffect extends IndicatorEffect {
  const BubbleEffect({
    double offset,
    double dotWidth = 10.0,
    double dotHeight = 10.0,
    double spacing = 8.0,
    double radius = 10,
    Color dotColor = Colors.grey,
    Color activeDotColor = AppColors.indicatorColor,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  }) : super(
    dotWidth: dotWidth,
    dotHeight: dotHeight,
    spacing: spacing,
    radius: radius,
    strokeWidth: strokeWidth,
    paintStyle: paintStyle,
    dotColor: dotColor,
    activeDotColor: activeDotColor,
  );

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return RectanglePainter(count: count, offset: offset, effect: this);
  }
}