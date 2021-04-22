import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
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
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: Color(0xff1d3400),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Workout',
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
                onPressed: () {},
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
