import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/views/terms&rules/terms.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/main_button.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    // controller: name,
                    decoration: fieldDecoration('Username'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MainButton(
                    title: 'Submit', onTap: () {  },
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
                          'By clicking Submit you agree to the following',
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
                            'Terms and Conditions',
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xff67b500),
                              decoration: TextDecoration.underline,
                              letterSpacing: -0.1000000033378601,
                            ),
                          ),
                        ),
                        Text(
                          'without reservation',
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
            ))
          ],
        ),
      ),
    );
  }
}
