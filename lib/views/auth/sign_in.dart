import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/user.dart';
import 'package:oxygen/services/services.dart';
import 'package:oxygen/views/auth/forgot_password.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:oxygen/views/root_page.dart';
import 'package:oxygen/widgets/back_arrow.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/main_button.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final int gender;

  const SignIn({Key key, this.gender}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name, password;
  bool load = false;

  signIn() async {
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => RootPage(),
    //     ));
    if (_formKey.currentState.validate()) {
      setState(() {
        load = true;
      });
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      var userProv = Provider.of<UserFunctions>(context, listen: false);
      var request = await post(Constants.apiURl + 'login', body: {
        'username': name.text,
        'password': password.text,
        'device_type': '${Platform.isIOS ? 'ios' : 'android'}',
        'fcm_token': '555555',
        'gender': '${widget.gender}'
      }, headers: {
        'Accept': 'application/json',
        'Accept-Language': LangProvider().getLocaleCode(),
      });
      var response = json.decode(request.body);
      if (response['status'] == true) {
        User user = User.fromJson(response['user']);
        userProv.setUser(user);
        Services().setToken(user.accessToken);
        Services().setUser(
            id: user.id,
            avatar: user.imageProfile,
            name: user.name,
            mobile: user.mobile,
            email: user.email,
            gender: user.gender);
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootPage(),
            ));
      } else {
        Fluttertoast.showToast(msg: response['message']);
        setState(() {
          load = false;
        });
      }
    }
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    name = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Direction(
      child: Scaffold(
        body: KeyboardDismiss(
          child: Column(
            children: [
              SafeArea(
                  child: Row(
                children: [
                  MyBackButton(),
                ],
              )),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SvgPicture.asset('assets/images/colored_logo.svg'),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Log in to Your Account'.trs(context),
                          style: TextStyle(
                            fontSize: 28,
                            color: const Color(0xff1d3400),
                            letterSpacing: 0.33764708709716795,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: name,
                          validator: (value) =>
                              FieldValidator.validate(value, context),
                          decoration: fieldDecoration('Username'.trs(context)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          obscuringCharacter: '*',
                          validator: (value) =>
                              FieldValidator.validate(value, context),
                          decoration: fieldDecoration('Password'.trs(context)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MainButton(
                          onTap: () {
                            signIn();
                          },
                          load: load,
                          title: 'Log In'.trs(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: const Color(0xffffffff),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ));
                    },
                    child: Text(
                      'Forgot your password?'.trs(context),
                      style: TextStyle(
                        fontSize: 17,
                        color: const Color(0xff67b500),
                        letterSpacing: -0.41000000190734864,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
