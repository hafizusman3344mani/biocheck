import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:biocheck/common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'equatable.dart';

enum WaveFormular {
  normal,
  standing,
  travelling,
}

const _tau = 2 * math.pi;

/// Signature for [Sinusoidals.builder] that creates a [SinusoidalItem] for a given index.
typedef SinusoidalItemBuilder = SinusoidalItem Function(
  BuildContext context,
  int index,
);

/// An utility class which holds [SinusoidalModel] for each child in [Sinusoidals].
class SinusoidalItem {
  const SinusoidalItem({
    this.model = const SinusoidalModel(),
    @required this.child,
  }) : assert(child != null);

  /// A given child at which will be clipped from to create a sinusoidal.
  final Widget child;

  /// Model given to visualize a sinuisodal.
  final SinusoidalModel model;
}

/// A class which holds params to form sinusoidal formulars.
///
/// For more information about sinusoidal: https://en.wikipedia.org/wiki/Sine_wave
///
/// Try demos to create your sinusoidal: https://www.desmos.com/calculator/ks3f232ook
///
class SinusoidalModel extends Equatable {
  const SinusoidalModel({
    this.formular = WaveFormular.normal,
    this.center = 0,
    this.translate = 0,
    this.amplitude = 10,
    this.frequency = 1,
    this.waves = 1,
  });

  /// Defines what wave formular to use.
  ///
  /// Defaults to [WaveFormular.normal] that uses general form sine wave.
  final WaveFormular formular;

  /// The peak deviation of the function from zero.
  ///
  /// Represent how much space will be clipped to form a wave
  /// from top to bottom, or bottom to top if `reverse = true`.
  final double amplitude;

  /// a non-zero center amplitude, specifies the origin the the wave.
  final double center; // midline

  /// The rate of change of the function argument.
  ///
  /// To make the repeat animation effect seamlessly, `frequency` must be divided by 0.5
  ///
  /// To change the direction of the wave, simply change the sign of `frequency`.
  /// * positive: LTR
  /// * negative: RTL
  final double frequency;

  /// Phase, where in its cycle the oscillation is at t = 0
  ///
  /// When `translate` is non-zero, the entire waveform appears to be shifted in time.
  ///
  /// A negative value represents a delay, and a positive value represents an advance.
  final double translate;

  /// Wave number (or angular wave number).
  final double waves;

  @protected
  double getY(double dx, double time) {
    assert(
      frequency % 0.5 == 0,
      'To get seamlessly animation effect , "frequency" must be divided by 0.5',
    );
    switch (formular) {
      case WaveFormular.travelling:
        return _getTravellingY(dx, time);
      case WaveFormular.standing:
        return _getStandingY(dx, time);
      case WaveFormular.normal:
      default:
        return _getNormalY(dx, time);
    }
  }

  double _getNormalY(double dx, double time) =>
      amplitude * math.sin(waves / 100 * dx - frequency * time + translate) +
      center;

  double _getStandingY(double dx, double time) =>
      amplitude *
          math.sin(waves / 100 * dx + translate) *
          math.sin(frequency * time) +
      center;

  double _getTravellingY(double dx, double time) =>
      amplitude *
          math.sin(waves / 100 * dx - frequency * time + translate) *
          math.sin(frequency * time) +
      center;

  @override
  List<Object> get props => [
        formular,
        amplitude,
        center,
        frequency,
        translate,
        waves,
      ];
}


class CombinedWave extends StatefulWidget {
  const CombinedWave({
    Key key,
    @required this.models,
    int period,
    bool reverse,
    @required this.child,
  });

  /// A given child at which will be  from to create a wave.
  final Widget child;

  /// Models given to visualize a combined wave.
  final List<SinusoidalModel> models;

  @override
  _CombinedWaveState createState() => _CombinedWaveState();
}

class _CombinedWaveState extends State<CombinedWave> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;
@override
  void initState() {
  controller = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);
  animation = Tween(begin: 0.0, end: 1.0).animate(controller)
    ..addListener(() {
      setState(() {
        fraction = animation.value;
      });
    });
  Timer(Duration(seconds: 2),()
  {
   /// controller.forward(from: 0.0);
  });


    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:ShapesPainter(
        fraction: fraction,
        time: controller,
        models: widget.models,
      ) ,
        child: widget.child,
    );
  }
}

class ShapesPainter extends CustomPainter {
  ShapesPainter({
    this.time,
    this.models,
    this.fraction
  });

  static final List<Offset> offsets = <Offset>[];

  final Animation time;
  final List<SinusoidalModel> models;
  double fraction;

  @override
  void paint(Canvas canvas, Size size) {
    offsets.clear();
    var paint = Paint()
      ..color =AppColors.dashboardTextColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (double dx = 0.0; dx <= size.width; dx++) {
     offsets.add(Offset(dx, _getY(size, dx)));
    }
    canvas.drawPoints(PointMode.polygon,offsets,paint);
  }

  double _getY(Size size, double dx) {
    final y = models
        .map((model) => model._getNormalY(dx, fraction))
        .reduce((current, next) => current + next);
    final amplitude = models
        .map((model) => model.amplitude)
        .reduce((current, next) => current + next);
    return y + amplitude;
  }

  @override
  bool shouldRepaint(ShapesPainter oldDelegate)=>true;

}

