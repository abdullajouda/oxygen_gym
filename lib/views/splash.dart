import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/services/Localization/lang_provider.dart';
import 'package:oxygen/views/select_branch.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return Timer(_duration, setLandingPage);
  }

  setLandingPage() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectBranch(),
        ));
  }

  getSettings() async {
    var set = Provider.of<SettingsOperation>(context, listen: false);
    var request = await get(Constants.apiURl + 'getSetting', headers: {
      'Accept-Language': '${LangProvider().getLocaleCode()}',
      'Accept': 'application/json',
    });
    var response = json.decode(request.body);
    SettingsModel settings = SettingsModel.fromJson(response['items']);
    set.setSettings(settings);
  }

  @override
  void initState() {
    getSettings().then((value) => startTime());
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/splash_forground.svg',
              height: size.height * .9,
              fit: BoxFit.fitHeight,
            ),
            SvgPicture.asset('assets/images/logo.svg'),
          ],
        ),
      ),
    );
  }
}
