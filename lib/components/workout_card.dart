import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/workout.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:oxygen/widgets/book_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkOutCard extends StatefulWidget {
  final WorkoutModel workout;
  final String date;
  final VoidCallback refresh;

  const WorkOutCard({Key key, this.workout, this.date, this.refresh})
      : super(key: key);

  @override
  _WorkOutCardState createState() => _WorkOutCardState();
}

class _WorkOutCardState extends State<WorkOutCard> {
  bool load = false;

  bookService() async {
    setState(() {
      load = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await post(Constants.apiURl + 'bookAppointment', body: {
      'order_date': '${widget.date}',
      'target_id': '${widget.workout.id}',
      'type': '1',
    }, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${prefs.getString('userToken')}',
      'Authorization': Constants.token,
      'Accept-Language': LangProvider().getLocaleCode(),
    });
    var response = json.decode(request.body);
    Fluttertoast.showToast(msg: response['message']);
    widget.refresh.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0x80e4e4e4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SvgPicture.asset(
                        'assets/icons/Flame.svg',
                        color: Color(0xffc6c6c6),
                      ),
                    ),
                    Text(
                      'Workout'.trs(context),
                      style: TextStyle(
                        fontSize: 22,
                        color: const Color(0xff67b500),
                        letterSpacing: 0.35000000190734865,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SvgPicture.asset(
                      'assets/icons/clock.svg',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.workout.from.substring(0, 5)} ',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xff1d3400),
                          letterSpacing: -0.24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '- ',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xff1d3400),
                          letterSpacing: -0.24,
                        ),
                      ),
                      Text(
                        '${widget.workout.to}',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xff1d3400),
                          letterSpacing: -0.24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SvgPicture.asset(
                      'assets/icons/profile.svg',
                    ),
                  ),
                  Text(
                    '${'Available'.trs(context)}: ${widget.workout.availableNo - widget.workout.currentOrders}',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color(0xff1d3400),
                      letterSpacing: -0.24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          widget.workout.inOrders == 1
              ? Text(
                  'Booked'.trs(context),
                  style: TextStyle(
                    fontSize: 17,
                    color: kPrimaryColor,
                    letterSpacing: -0.41000000190734864,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : BookButton(
                  available: widget.workout.availableNo,
                  currentOrders: widget.workout.currentOrders,
                  load: load,
                  book: () => bookService(),
                )
        ],
      ),
    );
  }
}
