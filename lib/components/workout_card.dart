import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/models/workout.dart';
import 'package:oxygen/services/Localization/localization.dart';

class WorkOutCard extends StatelessWidget {
  final WorkoutModel workout;

  const WorkOutCard({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0x80e4e4e4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: SvgPicture.asset(
                        'assets/icons/Flame.svg',
                        color: Color(0xffc6c6c6),
                      ),
                    ),
                    Text(
                      'Workout'.trs(context),
                      style: TextStyle(
                        fontSize: 22,
                        color: const Color(0xff67b500),
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
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${workout.from.substring(0, 5)} ',
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
                        '${workout.to}',
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
                    '${'Available'.trs(context)}: ${workout.availableNo}',
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
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              color: workout.availableNo == 0
                  ? Color(0xffc6c6c6)
                  : Color(0xff67b500),
            ),
            child: Center(
              child: workout.availableNo == 0
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
          )
        ],
      ),
    );
  }
}
