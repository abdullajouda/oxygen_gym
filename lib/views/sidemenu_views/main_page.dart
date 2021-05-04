import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/components/main_page_cards.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/models/user.dart';
import 'package:oxygen/views/main_page_views/classes.dart';
import 'package:oxygen/views/main_page_views/doctor.dart';
import 'package:oxygen/views/main_page_views/personal_trainer.dart';
import 'package:oxygen/views/main_page_views/workout.dart';
import 'package:oxygen/widgets/drawer.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final VoidCallback openMenu;

  const MainPage({Key key, this.openMenu}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MainPageCard> _card = [];

  @override
  Widget build(BuildContext context) {
    var set = Provider.of<SettingsOperation>(context);
    var userProv = Provider.of<UserFunctions>(context);
    var size = MediaQuery.of(context).size;

    _card.addAll({
      if (set.settingsModel.showWorkout == 1)
        MainPageCard(
          page: WorkOut(),
          title: 'Workout',
          image: 'assets/images/workout.jpg',
          icon: SvgPicture.asset(
            'assets/icons/Flame.svg',
            width: 13,
            height: 18,
          ),
        ),
      if (set.settingsModel.showDoctors == 1)
        MainPageCard(
          page: Doctors(),
          title: 'Doctors',
          image: 'assets/images/doctor.jpg',
          icon: SvgPicture.asset(
            'assets/icons/Heart.svg',
            width: 13,
            height: 12,
          ),
        ),
      if (set.settingsModel.showClasses == 1)
        MainPageCard(
          page: Classes(),
          title: 'Classes',
          image: 'assets/images/classes.jpg',
          icon: SvgPicture.asset(
            'assets/icons/Heart.svg',
            width: 13,
            height: 12,
          ),
        ),
      if (set.settingsModel.showPersonal == 1)
        MainPageCard(
        page: PersonalTrainers(),
        title: 'Personal trainer',
        image: 'assets/images/Personal_trainer.png',
        icon: SvgPicture.asset(
          'assets/icons/Heart.svg',
          width: 13,
          height: 12,
        ),
      ),
    });
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MenuButton(
                      onTap: widget.openMenu,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userProv.user.name}',
                          style: TextStyle(
                            fontSize: 22,
                            color: const Color(0xff273443),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: size.width * .5),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xff67b500),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Welcome Back,'.trs(context),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // TextSpan(
                                //   text: 'Last seen'.trs(context),
                                //   style: TextStyle(
                                //     color: const Color(0xff000000),
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: ' TODAY, JUNE 5',
                                //   style: TextStyle(
                                //     color: const Color(0xff000000),
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    image: DecorationImage(
                      image: NetworkImage(userProv.user.imageProfile),
                      fit: BoxFit.cover,
                    ),
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => _card[index].page,
                  ));
                },
                child: MainPageCard(
                  image: _card[index].image,
                  icon: _card[index].icon,
                  title: _card[index].title,
                  page: _card[index].page,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
