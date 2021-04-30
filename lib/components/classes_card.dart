import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/models/classes.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'dart:math' as math;

class ClassCard extends StatelessWidget {
  final int type;
  final ClassModel myClass;

  const ClassCard({Key key, this.type = 1, this.myClass}) : super(key: key);

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
              color: myClass.availableNo == 0
                  ? Color(0xffc6c6c6)
                  : Color(0xff67b500),
            ),
            child: Center(
              child: myClass.availableNo == 0
                  ? Text(
                      'Class Full'.trs(context),
                      style: TextStyle(
                        fontSize: 17,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.41000000190734864,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
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
                        '${myClass.specialization}',
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
                        '${myClass.trainerName}',
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
                          '${myClass.from.substring(0, 5)} ',
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
                          '${myClass.to}',
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
                      '${'Available'.trs(context)}: ${myClass.availableNo}',
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
