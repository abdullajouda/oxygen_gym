import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/models/menuitem.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/models/user.dart';
import 'package:oxygen/views/sidemenu_views/language_change.dart';
import 'package:oxygen/views/sidemenu_views/reservation_history.dart';
import 'package:oxygen/views/terms&rules/privacy.dart';
import 'package:oxygen/views/terms&rules/rules.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/drawer.dart';
import 'package:oxygen/widgets/logout_sheet.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'sidemenu_views/change_password.dart';
import 'sidemenu_views/main_page.dart';
import 'sidemenu_views/trainers_schedule.dart';

class RootPage extends StatefulWidget {
  final int id;

  const RootPage({Key key, this.id}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final GlobalKey<ScaffoldState> sideMenuKey = GlobalKey<ScaffoldState>();

  onClick() {
    setState(() {
      final _state = sideMenuKey.currentState;
      _state.openDrawer();
    });
  }

  _makePhoneCall() async {
    var set = Provider.of<SettingsOperation>(context, listen: false);
    if (await canLaunch('tel:${set.settingsModel.mobile}')) {
      await launch('tel:${set.settingsModel.mobile}');
    } else {
      throw 'Could not launch ${set.settingsModel.mobile}';
    }
  }

  int id = 0;
  List<MenuItem> items = [];

  @override
  void initState() {
    items.addAll([
      MenuItem(
        id: 0,
        title: "Home",
        isSelected: true,
        icon: 'assets/icons/Icon – Tab Bar - Home.svg',
        body: MainPage(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 1,
        title: "Change Password",
        isSelected: false,
        icon: 'assets/icons/Icon – Tab Bar - More.svg',
        body: ChangePassword(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 2,
        title: "Gym Rules",
        isSelected: false,
        icon: 'assets/icons/Icon – Tab Bar - Trend.svg',
        body: GymRules(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 3,
        title: "Reservation History",
        isSelected: false,
        icon: 'assets/icons/Icon – Tab Bar - Tasks.svg',
        body: ReservationHistory(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 4,
        title: "Privacy & policy",
        isSelected: false,
        icon: 'assets/icons/Icon – Tab Bar - Privacy.svg',
        body: Privacy(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 5,
        title: "App Language",
        isSelected: false,
        icon: 'assets/icons/globe.svg',
        body: ChangeLanguage(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 6,
        title: "Trainers schedule",
        isSelected: false,
        icon: 'assets/icons/calendar-alt.svg',
        body: TrainersSchedule(
          openMenu: () => onClick(),
        ),
      ),
      MenuItem(
        id: 7,
        title: "Call Us",
        isSelected: false,
        icon: 'assets/icons/Icon – Tab Bar - Add Number.svg',
      ),
    ]);
    if (widget.id != null) {
      setState(() {
        id = widget.id;
      });
    } else {
      id = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProv = Provider.of<UserFunctions>(context);
    return Direction(
      child: Scaffold(
        key: sideMenuKey,
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000.0),
                              image: DecorationImage(
                                image: NetworkImage(userProv.user.imageProfile),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Welcome'.trs(context),
                              style: TextStyle(
                                fontSize: 22,
                                color: const Color(0xff1d3400),
                                letterSpacing: 0.35000000190734865,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            '@${userProv.user.name}',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color(0x66000000),
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: buildMenu(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35, left: 15, right: 15),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  enableDrag: true,
                                  isDismissible: true,
                                  builder: (context) => Logout(),
                                );
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/logout.svg'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Logout'.trs(context),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: const Color(0xffff4d4d),
                                        letterSpacing: -0.24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/colored_logo.svg',
                              height: 50,
                              width: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 2),
                              child: Text(
                                'Oxygen Gym',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0x661d3400),
                                  letterSpacing: -0.192,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'All rights reserved © 2021'.trs(context),
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0x661d3400),
                                letterSpacing: -0.192,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: id == items.last.id ? items[0].body : items[id].body,
      ),
    );
  }

  Widget buildMenu() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        indent: 35,
        endIndent: 20,
      ),
      itemCount: items.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                items.forEach((element) {
                  element.isSelected = false;
                });
                items[index].isSelected = true;
                // widget.title = items[index].title;
                id = items[index].id;
                final _state = sideMenuKey.currentState;
                Navigator.pop(context);
              });
              if (id == items.last.id) {
                _makePhoneCall();
              }
            },
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      items[index].icon,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      items[index].title.trs(context),
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color(0xff1d3400),
                        letterSpacing: -0.24,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
