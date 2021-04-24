import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'dart:math' as math;

class DoctorCard extends StatelessWidget {
  final int type;

  const DoctorCard({Key key, this.type = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0x80e4e4e4),
          ),
        ),
        Positioned(
          top: 10,
          right: LangProvider().getLocaleCode() == 'ar' ? null : 10,
          left: LangProvider().getLocaleCode() == 'ar' ? 10 : null,
          child: type == 1
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
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              color: const Color(0xff67b500),
            ),
            child: Center(
              child: Text(
                'Book Now'.trs(context),
                style: TextStyle(
                  fontSize: 17,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.41000000190734864,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
                        child: type == 1
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
                        'Fitness',
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
                        'Dr. Iyass Hrazin',
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
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xff1d3400),
                          letterSpacing: -0.24,
                        ),
                        children: [
                          TextSpan(
                            text: '7:15 ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '- ',
                            style: TextStyle(
                              color: const Color(0xffbebebe),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '8:30 PM',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
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
                      'Available: 13',
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
    );
  }
}
