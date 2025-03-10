import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:oxygen/components/doctor_card.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/doctor.dart';
import 'package:oxygen/models/slider.dart';
import 'package:oxygen/widgets/app_bar.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:oxygen/widgets/calender.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/loader.dart';
import 'package:oxygen/widgets/no_booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  ScrollController _controller;
  double _value = 0.0;
  List<DoctorModel> _list = [];
  List<SliderModel> _sliderItems = [];

  bool load = false;
  DateTime _date = DateTime.now();

  getDoctors() async {
    setState(() {
      load = true;
      _list.clear();
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await post(Constants.apiURl + 'getDoctors', body: {
      'date': '${_date.toString().split(' ')[0]}',
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('userToken')}',
      // 'Authorization': Constants.token,
      'Accept-Language': LangProvider().getLocaleCode(),
    });
    var response = json.decode(request.body);
    if (response['status'] == true) {
      List rs = response['items'];
      rs.forEach((element) {
        DoctorModel wm = DoctorModel.fromJson(element);
        _list.add(wm);
      });
    } else {
      Fluttertoast.showToast(msg: response['message']);
    }
    setState(() {
      load = false;
    });
  }

  getSlider() async {
    var request = await get(Constants.apiURl + 'getSliders/2', headers: {
      'Accept': 'application/json',
      'Accept-Language': LangProvider().getLocaleCode(),
    });
    var response = json.decode(request.body);
    List rs = response['items'];
    rs.forEach((element) {
      SliderModel slider = SliderModel.fromJson(element);
      _sliderItems.add(slider);
    });
    setState(() {});
  }

  void _scrollListener() {
    setState(() {
      _value = _controller.offset;
    });
  }

  @override
  void initState() {
    getSlider();
    getDoctors();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Direction(
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
                child: MyAppBar(
                  date: _date,refresh: () {
                  getDoctors();
                },
                  openCalender: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black.withOpacity(0.1),
                      transitionDuration: Duration(milliseconds: 300),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return GestureDetector(child: MyCalender(date: _date,));
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                              .animate(anim1),
                          child: child,
                        );
                      },
                    ).then((value) {
                      if (value is Map<String, dynamic>) {
                        if (value['date'] != null) {
                          setState(() {
                            _date = value['date'];
                          });
                          getDoctors();
                        }
                      }
                    });
                  },
              title: 'Doctors'.trs(context),
            )),
            _sliderItems.length == 0
                ? Container()
                : ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: _value != 0
                        ? 160 - _value >= 60
                            ? 160 - _value
                            : 60
                        : 160,
                    viewportFraction: 0.9,
                  // enlargeCenterPage: true,
                    enableInfiniteScroll: false
                    // disableCenter: true,
                    ),
                items: _sliderItems
                    .map(
                      (item) => ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 60),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            height: _value != 0
                                ? 160 - _value >= 60
                                    ? 160 - _value
                                    : 60
                                : 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(item.image),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 1.0),
                                end: Alignment(0.0, -1.0),
                                colors: [
                                  const Color(0x80000000),
                                  const Color(0x00000000)
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 15, right: 15),
                                      child: SvgPicture.asset(
                                          'assets/icons/Glyph.svg'),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: const Color(0xffffffff),
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Book an appointment'.trs(context),
                    style: TextStyle(
                      fontSize: 22,
                      color: const Color(0xff1d3400),
                      letterSpacing: 0.35000000190734865,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: load
                  ? Loader()
                  : _list.length == 0
                  ? NoBookingFound()
                  : ListView.builder(
                      controller: _controller,
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      shrinkWrap: true,
                      itemCount: _list.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: DoctorCard(
                              doctor: _list[index],
                              type: _list[index].type,
                          date: _date.toString().split(' ')[0],
                          refresh: () => getDoctors(),
                            ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
