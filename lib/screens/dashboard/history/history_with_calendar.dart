import 'package:biocheck/common/ui_widgets/calendar/table_calendar.dart';
import 'package:biocheck/common/ui_widgets/faded_widget2.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/textview.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HistoryCalendar extends StatefulWidget {
  @override
  _HistoryCalendarState createState() => _HistoryCalendarState();
}

class _HistoryCalendarState extends State<HistoryCalendar>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  CalendarController _calendarController;

DateTime selected;
  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 3)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 23)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    selected = day;
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  final Map<DateTime, List> _holidays = {
    DateTime(2020, 1, 1): ['New Year\'s Day'],
/*    DateTime(2020, 1, 6): ['Epiphany'],
    DateTime(2020, 2, 14): ['Valentine\'s Day'],
    DateTime(2020, 4, 21): ['Easter Sunday'],
    DateTime(2020, 4, 22): ['Easter Monday'],*/
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bodyColor,
        body: FadeWidget2(
          milisec: 400,
          curve: Curves.easeIn,
          child: ListView(
            shrinkWrap: true,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                color: Colors.white,
                height: 50.0,
                padding: EdgeInsets.only(right: 30.0),
                width: AppValue.screenWidth(context),
                child: Textview2(
                  color: AppColors.dashboardTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  title: DateFormat('MMMM yyyy', 'en')
                      .format(DateTime.now())
                      .toString(),
                ),
              ),
              _buildTableCalendar(),
              const SizedBox(height: 10.0),
              for(int index=0; index<_selectedEvents.length;index++)
                Container(
                    child: getListWidget(AppColors.parrotGreen, "27.07.2019", "20.45",
                        AppValue.screenWidth(context), index))

             /* Expanded(child: _buildEventList()),*/
            ],
          ),
        ),

    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      selectedDay: selected,
      locale: 'en',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
      ),
      headerVisible: false,
      onDaySelected: _onDaySelected,
      formatAnimation: FormatAnimation.slide,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      itemCount: _selectedEvents.length,
      itemBuilder: (context, index) {
        return Container(
            child: getListWidget(AppColors.parrotGreen, "27.07.2019", "20.45",
                AppValue.screenWidth(context), index));
      },
    );
  }

  Widget getListWidget(List<Color> colors, String title, String subTitle, double progress, int index) {
    if(index ==0) {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Material(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3.0),
                    topLeft: Radius.circular(3.0)),
                elevation: 0.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  height: 94.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textview(title, 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                                Textview('CVP', 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textview(subTitle, 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                                Textview('1:08:43', 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: GetIcon(
                            width: 52.0,
                            height: 52.0,
                            path: GlobalResources.bikingPath,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                height: 10.0,
                width: progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(3.0),
                      bottomLeft: Radius.circular(3.0)),
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  ),
                ),
                duration: Duration(milliseconds: 1000),
              ),
            ],
          ),
        ),
      );
    }else{
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Material(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3.0),
                    topLeft: Radius.circular(3.0)),
                elevation: 0.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  height: 94.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textview(title, 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                                Textview('CVP', 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textview(subTitle, 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                                Textview('1:08:43', 20.0, FontWeight.w300,
                                    AppColors.welcomeTextColor,
                                    TextAlign.start),
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: GetIcon(
                            width: 52.0,
                            height: 52.0,
                            path: GlobalResources.bikingPath,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
             /* AnimatedContainer(
                height: 10.0,
                width: progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(3.0),
                      bottomLeft: Radius.circular(3.0)),
                  gradient: WidgetProps.getAppGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  ),
                ),
                duration: Duration(milliseconds: 1000),
              ),*/
            ],
          ),
        ),
      );
    }
  }
}
