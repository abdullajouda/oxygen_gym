import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:oxygen/components/reservation_card.dart';
import 'package:oxygen/components/trainer_card.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/trainers_timing.dart';
import 'package:oxygen/widgets/calender.dart';
import 'package:oxygen/widgets/loader.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TrainersSchedule extends StatefulWidget {
  final VoidCallback openMenu;

  const TrainersSchedule({Key key, this.openMenu}) : super(key: key);

  @override
  _TrainersScheduleState createState() => _TrainersScheduleState();
}

class _TrainersScheduleState extends State<TrainersSchedule> {
  DateTime date;
  List<Trainer> trainers = [];
  bool load = false;

  getTrainers() async {
    setState(() {
      load = true;
    });
    var prefs = await SharedPreferences.getInstance();
    var request = await post(Constants.apiURl + 'getTrainers', body: {
      'date': '${date.toString().split(' ')[0]}',
      // 'date': '2021-05-01',
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
        Trainer wm = Trainer.fromJson(element);
        trainers.add(wm);
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
    date = DateTime.now();
    getTrainers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MenuButton(
                      onTap: widget.openMenu,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * .75),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trainers schedule'.trs(context),
                            style: TextStyle(
                              fontSize: 25,
                              color: const Color(0xff1d3400),
                              letterSpacing: 0.38588235473632815,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 13,
                                color: const Color(0xff67b500),
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '${DateFormat('EEEE').format(date).trs(context)}, ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '${date.toString().split(' ')[0]}',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black.withOpacity(0.1),
                      transitionDuration: Duration(milliseconds: 300),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return GestureDetector(child: MyCalender(date: date,));
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, -1), end: Offset(0, 0))
                                  .animate(anim1),
                          child: child,
                        );
                      },
                    ).then((value) {
                      if (value is Map<String, dynamic>) {
                        if (value['date'] != null) {
                          setState(() {
                            date = value['date'];
                          });
                          getTrainers();
                        }
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/calender.svg'),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Calendar'.trs(context),
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color(0x801d3400),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: load
              ? Loader()
              : ListView.builder(
                  itemCount: trainers.length,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 15, left: 15),
                      child: TrainerCard(
                        trainer: trainers[index],
                      )),
                ),
        )
      ],
    );
  }
}
