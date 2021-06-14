import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:oxygen/services/Localization/localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/main.dart';
import 'package:oxygen/widgets/main_button.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatefulWidget {
  final VoidCallback openMenu;

  const ChangeLanguage({Key key, this.openMenu}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool arabic, english;

  changeLanguage() async {
    var lang = Provider.of<LangProvider>(context, listen: false);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (arabic) {
      lang.setLocale(locale: Locales.ar);
    } else {
      lang.setLocale(locale: Locales.en);
    }
    await post(Constants.apiURl + 'updateFcmToken', body: {
      'accept_notification': '1',
      'device_type': '${Platform.isIOS ? 'ios' : 'android'}',
      'fcm_token':'111',
    }, headers: {
      'Accept': 'application/json',
      'Accept-Language': LangProvider().getLocaleCode(),
    });
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
  }

  @override
  void initState() {
    if (LangProvider().getLocaleCode() == 'ar') {
      arabic = true;
      english = false;
    } else {
      arabic = false;
      english = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
                  'Change Language'.trs(context),
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
        Column(
          children: [
            Container(
              width: size.width * .9,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Text(
                    'Note:'.trs(context),
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 17,
                      color: const Color(0xff67b500),
                      letterSpacing: -0.41000000190734864,
                    ),
                  ),
                  Text(
                    'Changing the language will completely change the application language'
                        .trs(context),
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 17,
                      color: const Color(0xff6f6f6f),
                      letterSpacing: -0.41000000190734864,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          arabic = true;
                          english = false;
                        });
                      },
                      child: _languageField(
                          title: 'Arabic Language'.trs(context),
                          selected: arabic)),
                ),
                Divider(
                  thickness: 1,
                  indent: 16,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          arabic = false;
                          english = true;
                        });
                      },
                      child: _languageField(
                          title: 'English Language'.trs(context),
                          selected: english)),
                ),
                Divider(
                  thickness: 1,
                  indent: 16,
                  height: 1,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MainButton(
            onTap: () => changeLanguage(),
            title: 'Change'.trs(context),
          ),
        )
      ],
    );
  }

  Widget _languageField({String title, bool selected}) {
    return Container(
      height: 44,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: const Color(0xff000000),
              letterSpacing: -0.41000000190734864,
            ),
          ),
          selected
              ? SvgPicture.asset('assets/icons/radio_button.svg')
              : SvgPicture.asset(
                  'assets/icons/Checkboxes – Radio - Empty White.svg',
                  color: kPrimaryColor,
                )
        ],
      ),
    );
  }
}
