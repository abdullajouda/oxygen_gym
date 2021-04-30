import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/components/workout_card.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/workout.dart';
import 'package:oxygen/widgets/app_bar.dart';
import 'package:oxygen/widgets/drawer.dart';
import 'package:oxygen/services/Localization/localization.dart';

class WorkOut extends StatefulWidget {
  @override
  _WorkOutState createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  ScrollController _controller;
  double _value = 0.0;
  List<WorkoutModel> _list = [];

  void _scrollListener() {
    setState(() {
      _value = _controller.offset;
    });
  }

  bool load = false;

  getWorkouts() async {
    setState(() {
      load = true;
    });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await post(Constants.apiURl + 'getWorkouts', body: {
      'date': '',
    }, headers: {
      'Accept': 'application/json',
      'Accept-Language': LangProvider().getLocaleCode(),
    });
    var response = json.decode(request.body);
    if (response['status'] == true) {
      List rs = response['items'];
      rs.forEach((element) {
        WorkoutModel wm = WorkoutModel.fromJson(element);
        _list.add(wm);
      });
    } else {
      Fluttertoast.showToast(msg: response['message']);
    }
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    getWorkouts();
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
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: MyAppBar(
            title: 'Workout'.trs(context),
          )),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 60),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: _value != 0
                      ? 160 - _value >= 60
                          ? 160 - _value
                          : 60
                      : 160,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false
                  // disableCenter: true,
                  ),
              items: [1, 2]
                  .map(
                    (item) => ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 60),
                      child: Container(
                        height: _value != 0
                            ? 160 - _value >= 60
                                ? 160 - _value
                                : 60
                            : 160,
                        decoration: BoxDecoration(
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
                                    'Here text Titel for an example Next line add here',
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
            child: load?Center(child: CircularProgressIndicator()):GridView.builder(
                controller: _controller,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                shrinkWrap: true,
                itemCount: _list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 1),
                itemBuilder: (context, index) => WorkOutCard(workout: _list[index],)),
          )
        ],
      ),
    );
  }
}
