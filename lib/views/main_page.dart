import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/components/main_page_cards.dart';
import 'package:oxygen/views/main_page_views/workout.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MainPageCard> _card = [
    MainPageCard(
      title: 'Workout',
      image: 'assets/images/workout.jpg',
      icon: SvgPicture.asset(
        'assets/icons/Flame.svg',
        width: 13,
        height: 18,
      ),
    ),
    MainPageCard(
      title: 'Doctor',
      image: 'assets/images/doctor.jpg',
      icon: SvgPicture.asset(
        'assets/icons/Heart.svg',
        width: 13,
        height: 12,
      ),
    ),
    MainPageCard(
      title: 'Classes',
      image: 'assets/images/classes.jpg',
      icon: SvgPicture.asset(
        'assets/icons/Heart.svg',
        width: 13,
        height: 12,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ezzdeen Al Madhoun',
                        style: TextStyle(
                          fontSize: 25,
                          color: const Color(0xff273443),
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
                              text: 'Welcome Back, ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Last seen TODAY, JUNE 5',
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
                  Container(
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      // image: DecorationImage(
                      //   image: const AssetImage(''),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _card.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 15, left: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkOut(),));
                  },
                  child: MainPageCard(
                    image: _card[index].image,
                    icon: _card[index].icon,
                    title: _card[index].title,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
