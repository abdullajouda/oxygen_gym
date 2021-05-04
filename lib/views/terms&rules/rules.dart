import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:provider/provider.dart';

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
    var set = Provider.of<SettingsOperation>(context);
    Size size = MediaQuery.of(context).size;
    return Direction(
      child: Scaffold(
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
                        fontSize: 28,
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
                      child: Html(
                        data: set
                            .settingsModel.rules.description
                            .replaceAll("\\r\\n", '') ??
                            '',
                      ),),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
