import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/widgets/app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalender extends StatefulWidget {
  @override
  _MyCalenderState createState() => _MyCalenderState();
}

class _MyCalenderState extends State<MyCalender> {
  DateTime _day;
  DateTime _focusedDay;
  List _getEventsForDay(DateTime day) {
    // return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        elevation: 7,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: size.height * .8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SafeArea(
                    child: MyAppBar(
                      title: 'Calender',
                    ),
                  ),
                  TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 30)),
                    focusedDay: DateTime.now().add(Duration(days: 1)),
                    headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(color: Colors.transparent),
                        rightChevronVisible: false,
                        formatButtonVisible: false,
                        leftChevronVisible: false),
                      eventLoader: (day) {
                        if (day.weekday == DateTime.monday) {
                          return [];
                        }

                        return [];
                      },
                    selectedDayPredicate: (day) {
                      return isSameDay(_day, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _day = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        todayTextStyle: TextStyle(
                          fontSize: 17,
                          color: const Color(0xff67b500),
                          letterSpacing: -0.41000000190734864,
                          fontWeight: FontWeight.w600,
                        ),
                        todayDecoration: BoxDecoration(),
                        selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: -0.41000000190734864,
                          fontWeight: FontWeight.w600,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
