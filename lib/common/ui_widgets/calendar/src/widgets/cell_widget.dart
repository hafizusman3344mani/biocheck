//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

part of table_calendar;

class CellWidget extends StatefulWidget {
  final String text;
  final String selectedtext;
  final bool isUnavailable;
  final bool isToday;
  final bool isSelected;
  final bool isWeekend;
  final bool isOutsideMonth;
  final bool isHoliday;
  final bool isEventDay;
  final CalendarStyle calendarStyle;

  const CellWidget({
    Key key,
    @required this.text,
    this.selectedtext,
    this.isUnavailable = false,
    this.isSelected = false,
    this.isToday = false,
    this.isWeekend = false,
    this.isOutsideMonth = false,
    this.isHoliday = false,
    this.isEventDay = false,
    @required this.calendarStyle,
  })  : assert(text != null),
        assert(calendarStyle != null),
        super(key: key);

  @override
  _CellWidgetState createState() => _CellWidgetState();
}

class _CellWidgetState extends State<CellWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
        .animate(_controller);

    _offsetFloat.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1200),
      curve: Ease.backOut,
      decoration: widget.isEventDay ? _buildCellDecoration() : BoxDecoration(),
      margin: widget.calendarStyle.cellMargin,
      alignment: Alignment.center,
      child: widget.isSelected
          ? (widget.isEventDay
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                    Flexible(
                      child: Text(
                        widget.selectedtext.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.text,
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
                ))
          : Text(
              widget.text,
              style: _buildCellTextStyle(),
            ),
    );
  }

  Decoration _buildCellDecoration() {
    if (widget.isSelected &&
        widget.calendarStyle.renderSelectedFirst &&
        widget.calendarStyle.highlightSelected) {
      return BoxDecoration(
        boxShadow: shadows(),
        shape: BoxShape.rectangle,
        gradient: WidgetProps.getAppGradient(colors: AppColors.parrotGreen),
        borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        ),
      );
    } else if (widget.isToday && widget.calendarStyle.highlightToday) {
      //   return BoxDecoration(shape: BoxShape.rectangle, gradient: WidgetProps.getAppGradient(colors:AppColors.parrotGreen),borderRadius: BorderRadius.all(Radius.circular(3.0),));
      return BoxDecoration(shape: BoxShape.rectangle);
    } else if (widget.isSelected && widget.calendarStyle.highlightSelected) {
      return BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: Offset(1.0, 1.0),
            blurRadius: 6.0,
          )
        ],
        shape: BoxShape.rectangle,
        gradient: WidgetProps.getAppGradient(colors: AppColors.parrotGreen),
        borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        ),
      );
    } else {
      return BoxDecoration(shape: BoxShape.rectangle);
    }
  }

  TextStyle _buildCellTextStyle() {
    if (widget.isUnavailable) {
      return widget.calendarStyle.unavailableStyle;
    } else if (widget.isSelected &&
        widget.calendarStyle.renderSelectedFirst &&
        widget.calendarStyle.highlightSelected) {
      return widget.calendarStyle.selectedStyle;
    } else if (widget.isToday && widget.calendarStyle.highlightToday) {
      return widget.calendarStyle.todayStyle;
    } else if (widget.isSelected && widget.calendarStyle.highlightSelected) {
      return widget.calendarStyle.selectedStyle;
    } else if (widget.isOutsideMonth && widget.isHoliday) {
      return widget.calendarStyle.outsideHolidayStyle;
    } else if (widget.isHoliday) {
      return widget.calendarStyle.holidayStyle;
    } else if (widget.isOutsideMonth && widget.isWeekend) {
      return widget.calendarStyle.outsideWeekendStyle;
    } else if (widget.isOutsideMonth) {
      return widget.calendarStyle.outsideStyle;
    } else if (widget.isWeekend) {
      return widget.calendarStyle.weekendStyle;
    } else if (widget.isEventDay) {
      return widget.calendarStyle.eventDayStyle;
    } else {
      return widget.calendarStyle.weekdayStyle;
    }
  }

  List<BoxShadow> shadows() {
    List<BoxShadow> list = [];
    list.add(BoxShadow(
      color: Colors.grey.withOpacity(0.8),
      offset: Offset(1.0, 1.0),
      blurRadius: 6.0,
    ));
    return list;
  }

}
