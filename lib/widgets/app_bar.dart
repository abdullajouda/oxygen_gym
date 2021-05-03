import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:oxygen/services/Localization/localization.dart';

import 'back_arrow.dart';
import 'back_button.dart';
import 'calender.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final double fontSize;
  final DateTime date;
  final bool isCalender;
  final VoidCallback openCalender;
  final VoidCallback refresh;

  MyAppBar({Key key, this.title, @required this.date, this.isCalender = false, this.openCalender, this.refresh, this.fontSize =32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    BackArrow(),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Back'.trs(context),
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff67b500),
                        letterSpacing: -0.41000000190734864,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: const Color(0xff1d3400),
                      letterSpacing: 0.41000000190734864,
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
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isCalender
                  ? Container()
                  : TextButton(
                      onPressed:openCalender,
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
                              fontSize: 12,
                              color: const Color(0x801d3400),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
              SizedBox(
                width: 5,
              ),
              isCalender
                  ? Container()
                  : IconButton(
                      icon: SvgPicture.asset('assets/icons/reset.svg'),
                      onPressed:refresh,
                    )
            ],
          )
        ],
      ),
    ));
  }
}
