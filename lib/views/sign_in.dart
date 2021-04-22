import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/widgets/back_arrow.dart';
import 'package:oxygen/widgets/back_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                MyBackButton(),
              ],
            )
          ),
          SvgPicture.asset('assets/images/colored_logo.svg'),
          Text(
            'Log in to Your Account',
            style: TextStyle(
              fontSize: 28,
              color: const Color(0xff1d3400),
              letterSpacing: 0.33764708709716795,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
