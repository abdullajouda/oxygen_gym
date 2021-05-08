import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/doctor.dart';
import 'package:oxygen/models/personal_trainers.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'dart:math' as math;

import 'package:oxygen/widgets/book_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalTrainerCard extends StatefulWidget {
  final int type;
  final PersonalTrainersModel trainer;
  final String date;
  final VoidCallback refresh;

  const PersonalTrainerCard(
      {Key key, this.type = 1, this.trainer, this.date, this.refresh})
      : super(key: key);

  @override
  _PersonalTrainerCardState createState() => _PersonalTrainerCardState();
}

class _PersonalTrainerCardState extends State<PersonalTrainerCard> {
  bool load = false;

  bookService() async {
    setState(() {
      load = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await post(Constants.apiURl + 'bookAppointment', body: {
      'order_date': '${widget.date}',
      'target_id': '${widget.trainer.id}',
      'type': '4',
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
      height: 190,
      child: Stack(
        children: [
          Container(
            height: 190,
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
            child: widget.trainer.inOrders == 1
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
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              image: DecorationImage(
                                image: NetworkImage(widget.trainer.avatar),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coach'.trs(context),
                              style: TextStyle(
                                fontSize: 22,
                                color: const Color(0xff67b500),
                                letterSpacing: 0.35000000190734865,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${widget.trainer.trainerName}',
                              style: TextStyle(
                                fontSize: 22,
                                color: const Color(0xff1d3400),
                                letterSpacing: -0.352,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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
                          color: kPrimaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.trainer.from.substring(0, 5)} ',
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
                            '${widget.trainer.to}',
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
        ],
      ),
    );
  }
}
