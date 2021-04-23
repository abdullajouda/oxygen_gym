import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/views/select_branch.dart';

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
    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectBranch(),));
    // var user = Provider.of<UserOperations>(context, listen: false);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('language', LangProvider().getLocaleCode());
    // if (prefs.getString('userToken') == null) {
    //   if (LangProvider().hasLocale()) {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => SignIn(),
    //         ));
    //   } else {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ChooseLanguage(),
    //       ),
    //     );
    //   }
    // }else{
      // user.setUser(User(
      //     id: prefs.getInt('id'),
      //     name: prefs.getString('name'),
      //     address: prefs.getString('address'),
      //     avatar:  prefs.getString('avatar'),
      //     email:  prefs.getString('email'),
      //     mobile: prefs.getString('mobile')
      // ) );
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen(),));
    // }
  }

  @override
  void initState() {
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
            SvgPicture.asset('assets/images/splash_forground.svg',height: size.height*.9,fit: BoxFit.fitHeight,),
            SvgPicture.asset('assets/images/logo.svg'),
          ],
        ),
      ),
    );
  }
}
