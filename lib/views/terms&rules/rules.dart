import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';

class GymRules extends StatefulWidget {
  @override
  _GymRulesState createState() => _GymRulesState();
}

class _GymRulesState extends State<GymRules> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KeyboardDismiss(
          child: Column(
            children: [
              SafeArea(
                  child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 17,bottom: 17),
                    child: Text(
                      'Gym Rules',
                      style: TextStyle(
                        fontSize: 34,
                        color: const Color(0xff1d3400),
                        letterSpacing: 0.41000000190734864,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        width: size.width,
                        height: size.height * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xff67b500),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Welcome,\nHere Some Rules',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: const Color(0xffffffff),
                                  letterSpacing: 0.35000000190734865,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Oxygen gym Administration',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: const Color(0x661d3400),
                                  letterSpacing: -0.24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 28,
                      top: -17,
                      child: SvgPicture.asset('assets/images/lightning.svg'))
                ],
              ),
              Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                            child: Text(
                              'That first step. We’re here to give you the motivation and guidance to start and keep running. '
                                  'A balanced mix of strength, endurance and mobility workouts, mostly 15 to 30 min each. '
                                  'Nothing too advanced, just the right amount of challenge to start improving your fitness.\n\nThis week we start '
                                  'at the beginning: what are the principles of very simple games, like Hangman and tic-tac-toe? How do these games work?'
                                  ' Why do people play them? What are the elements that define ga… \n\nDL has been introduced with the objective of moving '
                                  'Machine Learning closer to one of its original goals artificial intelligence.\n\nWe’re here to give you the motivation and guidance to start and keep running'
                                  'We’re here to give you the motivation and guidance to start and keep runningWe’re here to give you the motivation and guidance to start and keep runningWe’re here to give you the motivation and guidance to start and keep runningWe’re here to give you the motivation and guidance to start and keep running',
                              style: TextStyle(
                                fontSize: 17,
                                color: const Color(0xff000000),
                                letterSpacing: -0.41000000190734864,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
