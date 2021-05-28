import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/models/user.dart';
import 'package:oxygen/services/Localization/lang_provider.dart';
import 'package:oxygen/views/root_page.dart';
import 'package:oxygen/views/select_branch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    // getSettings();
    var _duration = new Duration(seconds: 2);
    return Timer(_duration, setLandingPage);
  }

  setLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userProv = Provider.of<UserFunctions>(context, listen: false);
    if(prefs.getString('userToken')!= null){
      userProv.setUser(User(
          id: prefs.getInt('id'),
          imageProfile: prefs.getString('avatar'),
          name: prefs.getString('name'),
          mobile: prefs.getString('mobile'),
          email: prefs.getString('email'),
          accessToken: prefs.getString('userToken'),
          gender: prefs.getInt('gender')
      ));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RootPage(),
          ));
    }else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SelectBranch(),
          ));
    }

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
    // startTime();q
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
            SvgPicture.asset('assets/images/logo.svg',height: size.height * .3,
              fit: BoxFit.fitHeight,),
          ],
        ),
      ),
    );
  }
}
