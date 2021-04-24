import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';

class GymRules extends StatefulWidget {
  final VoidCallback openMenu;

  const GymRules({Key key, this.openMenu}) : super(key: key);

  @override
  _GymRulesState createState() => _GymRulesState();
}

class _GymRulesState extends State<GymRules> {
  ScrollController _controller;
  double _value = 0.0;

  void _scrollListener() {
    setState(() {
      _value = _controller.offset;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  MenuButton(
                    onTap: widget.openMenu,
                  ),
                  Text(
                    'Gym Rules'.trs(context),
                    style: TextStyle(
                      fontSize: 32,
                      color: const Color(0xff1d3400),
                      letterSpacing: 0.38588235473632815,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: size.width,
                    height: _value != 0
                        ? 162 - _value >= 120
                            ? 162 - _value
                            : 120
                        : 162,
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
                            'Welcome,Here Some Rules'.trs(context),
                            style: TextStyle(
                              fontSize: 22,
                              color: const Color(0xffffffff),
                              letterSpacing: 0.35000000190734865,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: _value != 0
                                ? 10 - _value >= 0
                                ? 10 - _value
                                : 0
                                : 10,
                          ),
                          Text(
                            'Oxygen gym Administration'.trs(context),
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
                right: LangProvider().getLocaleCode() == 'ar' ? null : 28,
                left: LangProvider().getLocaleCode() == 'ar' ? 28 : null,
                top: -17,
                child: SvgPicture.asset(
                  'assets/images/lightning.svg',
                  fit: BoxFit.fitHeight,
                  height: _value != 0
                      ? 160 - _value >= 80
                          ? 160 - _value
                          : 80
                      : 160,
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView(
            controller: _controller,
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
                  ' Why do people play them? What are the elements that define ga… \n\nDL has been introduced with the objective of moving '
                  ' Why do people play them? What are the elements that define ga… \n\nDL has been introduced with the objective of moving '
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
      ),
    );
  }
}
