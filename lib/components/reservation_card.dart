import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/services/Localization/localization.dart';

import '../constants.dart';

class ReservationCard extends StatelessWidget {
  final int type;

  const ReservationCard({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff1d3400),
            ),
          ),
          Positioned(
            top: type == 3
                ? 7
                : type != 1
                    ? 15
                    : null,
            right: LangProvider().getLocaleCode() == 'ar' ? null : 15,
            left: LangProvider().getLocaleCode() == 'ar' ? 15 : null,
            child: SvgPicture.asset(
              _backImage(),
              height: type == 3
                  ? 140
                  : type != 1
                      ? 160
                      : 200,
              color: kPrimaryColor,
            ),
          ),
          Positioned(
            right: LangProvider().getLocaleCode() == 'ar' ? null : 25,
            left: LangProvider().getLocaleCode() == 'ar' ? 25 : null,
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/delete.svg'),
              onPressed: () {},
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SvgPicture.asset(
                        _icon(),
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      'Workout'.trs(context),
                      style: TextStyle(
                        fontSize: 22,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.35000000190734865,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SvgPicture.asset(
                      'assets/icons/clock.svg',
                      color: Color(0xffffffff),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffffffff),
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
                      'assets/icons/calender.svg',
                      height: 14,
                      width: 14.8,
                      color: Color(0xffffffff),
                    ),
                  ),
                  Text(
                    'Available: 13',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffffffff),
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
    );
  }

  String _backImage() {
    switch (type) {
      case 1:
        return 'assets/images/Flame.svg';
        break;
      case 2:
        return 'assets/images/fitness.svg';
        break;
      case 3:
        return 'assets/images/Heart.svg';
        break;
      default:
        return '';
    }
  }

  String _icon() {
    switch (type) {
      case 1:
        return 'assets/icons/Flame.svg';
        break;
      case 2:
        return 'assets/icons/fitness.svg';
        break;
      case 3:
        return 'assets/icons/Heart.svg';
        break;
      default:
        return '';
    }
  }
}
