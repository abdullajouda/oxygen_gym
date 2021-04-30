import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/views/terms&rules/terms.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/main_button.dart';
import 'package:oxygen/services/Localization/localization.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email;
  bool load = false;

  forgotPassword() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        load = true;
      });
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      var request = await post(Constants.apiURl + 'forgotPassword', body: {
        'email': email.text,
      }, headers: {
        'Accept': 'application/json',
        'Accept-Language': LangProvider().getLocaleCode(),
      });
      var response = json.decode(request.body);
      if (response['status'] == true) {
        Navigator.pop(context);
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
    email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: email,
                      validator: (value) =>
                          FieldValidator.validate(value, context),
                      decoration: fieldDecoration('Username'.trs(context)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MainButton(
                      load: load,
                      title: 'Submit'.trs(context),
                      onTap: () {
                        forgotPassword();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'By clicking Submit you agree to the following'
                                .trs(context),
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xff8c8c8c),
                              letterSpacing: -0.1000000033378601,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Terms(),
                                  ));
                            },
                            child: Text(
                              'Terms and Conditions'.trs(context),
                              style: TextStyle(
                                fontSize: 13,
                                color: const Color(0xff67b500),
                                decoration: TextDecoration.underline,
                                letterSpacing: -0.1000000033378601,
                              ),
                            ),
                          ),
                          Text(
                            'without reservation'.trs(context),
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xff8c8c8c),
                              letterSpacing: -0.1000000033378601,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
