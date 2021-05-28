import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/doctor.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'dart:math' as math;

import 'package:oxygen/widgets/book_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorCard extends StatefulWidget {
  final int type;
  final String date;
  final VoidCallback refresh;
  final DoctorModel doctor;

  const DoctorCard({Key key, this.type = 1, this.doctor, this.date, this.refresh}) : super(key: key);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool load = false;

  bookService() async {
    setState(() {
      load = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await post(Constants.apiURl + 'bookAppointment', body: {
      'order_date': '${widget.date}',
      'target_id': '${widget.doctor.id}',
      'type': '2',
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('userToken')}',
      // 'Authorization': Constants.token,
      'Accept-Language': LangProvider().getLocaleCode(),
    });
    var response = json.decode(request.body);
    Fluttertoast.showToast(msg: response['message']);
    widget.refresh.call();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0x80e4e4e4),
            ),
          ),
          Positioned(
            top: 10,
            right: LangProvider().getLocaleCode() == 'ar' ? null : 10,
            left: LangProvider().getLocaleCode() == 'ar' ? 10 : null,
            child: widget.type == 1
                ? Transform(
                    alignment: Alignment.center,
                    transform: LangProvider().getLocaleCode() == 'ar'
                        ? Matrix4.rotationY(math.pi)
                        : Matrix4.rotationY(0),
                    child: SvgPicture.asset('assets/images/fitness.svg'))
                : SvgPicture.asset('assets/images/Heart.svg'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: widget.doctor.inOrders == 1
                ? Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Booked'.trs(context),
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xffffffff),
                    letterSpacing: -0.41000000190734864,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                : BookButton(
                    currentOrders: widget.doctor.currentOrders,
                    available: widget.doctor.availableNo,
              book: () => bookService(),
              load: load,
                  ),
          ),
          Column(
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
                          child: widget.type == 1
                              ? SvgPicture.asset(
                                  'assets/icons/fitness.svg',
                                  color: Color(0xffc6c6c6),
                                )
                              : SvgPicture.asset(
                                  'assets/icons/Heart.svg',
                                  height: 17,
                                  color: Color(0xffc6c6c6),
                                ),
                        ),
                        Text(
                          '${widget.doctor.specialization}',
                          style: TextStyle(
                            fontSize: 22,
                            color: const Color(0xff67b500),
                            letterSpacing: 0.35000000190734865,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          '${widget.doctor.doctorName}',
                          style: TextStyle(
                            fontSize: 22,
                            color: const Color(0xff1d3400),
                            letterSpacing: -0.352,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                            '${widget.doctor.from.substring(0, 5)} ',
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
                            '${widget.doctor.to}',
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
                        '${'Available'.trs(context)}: ${widget.doctor.availableNo - widget.doctor.currentOrders}',
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
            ],
          ),
        ],
      ),
    );
  }
}
