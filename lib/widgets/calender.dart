import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:oxygen/widgets/app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import 'directions.dart';

class MyCalender extends StatefulWidget {
  final DateTime date;

  const MyCalender({Key key, this.date}) : super(key: key);
  @override
  _MyCalenderState createState() => _MyCalenderState();
}

class _MyCalenderState extends State<MyCalender> {
  DateTime _day = DateTime.now();
  DateTime _focusedDay;
  CalendarController _calendarController;
  @override
  void initState() {
    _calendarController = CalendarController();

    if(widget.date!=null)
      _day = widget.date;
    super.initState();
  } // List _getEventsForDay(DateTime day) {
  //   // return events[day] ?? [];
  // }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Direction(
        child: Material(
          elevation: 7,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SafeArea(
                      child: MyAppBar(
                        date: _day,
                        isCalender: true,
                        title: 'Calender'.trs(context),
                      ),
                    ),
                    TableCalendar(
                      calendarController: _calendarController,
                      startDay: DateTime.now(),
                      // firstDay:
                      endDay: DateTime.now().add(Duration(days: 30)),
                      // lastDay:
                      initialSelectedDay: _day,
                      // focusedDay:
                      locale: LangProvider().getLocaleCode() == 'ar'
                          ? 'ar_SA'
                          : 'en_US',
                      headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(color: Colors.transparent),
                          rightChevronVisible: false,
                          formatButtonVisible: false,
                          leftChevronVisible: false),
                      onDaySelected:(day, events, holidays) {
                          setState(() {
                            _day = day;
                          });
                          Navigator.of(context).pop({
                            'date': _day,
                          });
                      } ,
                      onVisibleDaysChanged: (first, last, format) {
                          _focusedDay = first;
                      },
                      // selectedDayPredicate: (day) {
                      //   return isSameDay(_day, day);
                      // },
                      // onDaySelected: (selectedDay, focusedDay) {
                      //   setState(() {
                      //     _day = selectedDay;
                      //     _focusedDay = focusedDay;
                      //   });
                      //   Navigator.of(context).pop({
                      //     'date': _day,
                      //   });
                      // },
                      // onPageChanged: (focusedDay) {
                      //   _focusedDay = focusedDay;
                      // },
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle: TextStyle(
                          color: Colors.black,
                        ),
                        weekdayStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          todayColor: Colors.transparent,
                          weekendStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            letterSpacing: -0.41000000190734864,
                          ),
                          weekdayStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            letterSpacing: -0.41000000190734864,
                          ),
                          todayStyle: TextStyle(
                            fontSize: 17,
                            color: const Color(0xff67b500),
                            letterSpacing: -0.41000000190734864,
                            fontWeight: FontWeight.w600,
                          ),
                          contentDecoration: BoxDecoration(),
                          selectedStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: -0.41000000190734864,
                            fontWeight: FontWeight.w600,
                          ),
                          selectedColor: kPrimaryColor,
                          // selectedDecoration: BoxDecoration(
                          //   color: kPrimaryColor,
                          //   shape: BoxShape.circle,
                          // ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
