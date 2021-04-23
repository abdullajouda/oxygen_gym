import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'back_arrow.dart';
import 'back_button.dart';
import 'calender.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                      'Back',
                      style: TextStyle(
                        fontSize: 17,
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
                      fontSize: 34,
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
                          text: 'Friday, ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '10/4/2021',
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
              TextButton(
                onPressed: () {
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: '',
                    barrierColor: Colors.black.withOpacity(0.1),
                    transitionDuration: Duration(milliseconds: 300),
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return GestureDetector(
                          child: MyCalender());
                    },
                    transitionBuilder: (context, anim1, anim2, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                            .animate(anim1),
                        child: child,
                      );
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/calender.svg'),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Calendar',
                      style: TextStyle(
                        fontSize: 13,
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
              IconButton(
                icon: SvgPicture.asset('assets/icons/reset.svg'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    ));
  }
}
