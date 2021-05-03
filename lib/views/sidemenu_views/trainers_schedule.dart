import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oxygen/components/reservation_card.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/widgets/calender.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'dart:math' as math;

class TrainersSchedule extends StatefulWidget {
  final VoidCallback openMenu;

  const TrainersSchedule({Key key, this.openMenu}) : super(key: key);

  @override
  _TrainersScheduleState createState() => _TrainersScheduleState();
}

class _TrainersScheduleState extends State<TrainersSchedule> {
  DateTime date;

  @override
  void initState() {
    date = DateTime.now();
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
                        return GestureDetector(child: MyCalender());
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, -1), end: Offset(0, 0))
                                  .animate(anim1),
                          child: child,
                        );
                      },
                    ).then((value) => null);
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
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xfff1f1f1),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right:
                            LangProvider().getLocaleCode() == 'ar' ? null : 10,
                        left:
                            LangProvider().getLocaleCode() == 'ar' ? 10 : null,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: LangProvider().getLocaleCode() == 'ar'
                              ? Matrix4.rotationY(math.pi)
                              : Matrix4.rotationY(0),
                          child: SvgPicture.asset(
                            'assets/images/running_light.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'Coach',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: const Color(0xff67b500),
                                      letterSpacing: 0.35000000190734865,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Iyass Hrazin',
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
                          SizedBox(
                            height: 10,
                          ),
                          GridView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 6,
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                            ),
                            itemBuilder: (context, index) => Wrap(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: SvgPicture.asset(
                                        'assets/icons/clock.svg',
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '7:15 ',
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
                                          '8:30 PM',
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
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
