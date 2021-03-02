import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/common_dashboard.dart';
import 'package:biocheck/common/ui_widgets/faded_widget.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/routepage.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/controllers/heart_rate_controller.dart';
import 'package:biocheck/generated/l10n.dart';
import 'package:biocheck/screens/common/counter_screen.dart';
import 'package:biocheck/screens/cronic_protocol/cronic_measuring.dart';
import 'package:biocheck/screens/freetraining/free_training_measure_screen.dart';
import 'package:biocheck/screens/popups/schedule_today_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MeasurementOptions extends StatefulWidget {
  int measuringFeature;


  MeasurementOptions(this.measuringFeature);

  @override
  _MeasurementOptionsState createState() => _MeasurementOptionsState();
}

class _MeasurementOptionsState extends State<MeasurementOptions>
    with SingleTickerProviderStateMixin {


  AnimationController controller;
  Animation<double> scaleAnimation;

  var opacity = 1.0;
  var squareScaleB = 1.0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInQuint);
    controller.forward(from: 1.0);
    controller.addListener(() {
      setState(() {
        squareScaleB = controller.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.easeOut,
      duration: Duration(
          milliseconds: 1500
      ),
      opacity: 1.0,
      child: Dashboard(
        WidgetProps.getAppGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.startButtonPopup,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Transform.scale(
                scale: squareScaleB,
                child:
                AnimatedOpacity(
                  curve: Curves.easeOutQuint,
                  duration: Duration(
                      milliseconds: 1200
                  ),
                  opacity: opacity,
                  child: Container(
                    height: AppValue.screenHeight(context) / 2,
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          getOption(S
                              .of(context)
                              .selYrSportOpt1),
                          getOption(S
                              .of(context)
                              .selYrSportOpt2),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
              Textview(S
                  .of(context)
                  .selYrTrainingLevel, 24.0, FontWeight.w300,
                  AppColors.dashboardTextColor, TextAlign.center)
            ],
          ),
        ),
        AppColors.dashboardTextColor.withOpacity(0.8),
      ),
    );
  }

  Widget getOption(String string) {
    return GestureDetector(
        onTap: ()
    {
      //opacity = 0.0;
      controller.forward(from: 0.8);
      showDialog(
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return ScheduleToday();
        },
      ).then((value) {
        if(value!=null) {
          Navigator.of(context).push(RoutePage(
            builder: (context) {
              return CounterWithWigetToGo(
                  widget.measuringFeature == Constants.CRONIC_PROTOCOL
                      ? CronicMeasurement(
                    'CVP',
                    Container(
                      child: Textview(S
                          .of(context)
                          .perfect, 30.0, FontWeight.w300,
                          AppColors.welcomeTextColor, TextAlign.center),
                    ),
                  )
                      : FreeTrainingMeasure(
                    'V R I J E  T R.',
                    Container(
                      child: Textview(S
                          .of(context)
                          .perfect, 30.0, FontWeight.w300,
                          AppColors.welcomeTextColor, TextAlign.center),
                    ),
                  ), widget.measuringFeature);
            },
          ));
        }
      });
      },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: AppValue.screenWidth(context),
            height: 90.0,
            child: Card(
              elevation: 4.0,
              child: Center(
                child: Textview(string, 16.0, FontWeight.w300,
                    AppColors.dashboardTextColor, TextAlign.center),
              ),
            ),
          ),
        ),
      );
    }
  }
