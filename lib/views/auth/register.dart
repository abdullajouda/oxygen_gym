import 'dart:ui';
import 'package:oxygen/services/Localization/localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/views/terms&rules/privacy.dart';
import 'package:oxygen/views/terms&rules/terms.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/main_button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool men = true;
  bool women = false;

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
                  Center(
                    child: Text(
                      'Create an Account'.trs(context),
                      style: TextStyle(
                        fontSize: 28,
                        color: const Color(0xff1d3400),
                        letterSpacing: 0.33764708709716795,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Container(
                      height: 122,
                      width: 122,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.0),
                        color: const Color(0xffebebeb),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/add.svg'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Add photo'.trs(context),
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xff8d8d8d),
                                letterSpacing: 0.07636363792419434,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Select Branch'.trs(context),
                      style: TextStyle(
                        fontSize: 28,
                        color: const Color(0xff1d3400),
                        letterSpacing: 0.33764708709716795,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        women = false;
                        men = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: _branchContainer(
                          image: 'assets/icons/Flame.svg',
                          text: 'Men Branch'.trs(context),
                          selected: men),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        men = false;
                        women = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: _branchContainer(
                          image: 'assets/icons/Heart.svg',
                          text: 'Women Branch'.trs(context),
                          selected: women),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      // controller: name,
                      decoration: fieldDecoration('Enter Your Member ID'.trs(context)),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      // controller: password,
                      decoration: fieldDecoration('Enter Your WhatsApp Number'.trs(context)),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Terms(),
                                ));
                          },
                          child: Text(
                            'Terms of Service'.trs(context),
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xff67b500),
                              letterSpacing: -0.07999999523162842,
                            ),
                          ),
                        ),
                        Text(
                          'and'.trs(context),
                          style: TextStyle(
                            fontSize: 13,
                            color: const Color(0xff8a8a8f),
                            letterSpacing: -0.07999999523162842,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Privacy(),
                                ));
                          },
                          child: Text(
                            'Privacy Policy'.trs(context),
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xff67b500),
                              letterSpacing: -0.07999999523162842,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MainButton(
                      title: 'Registration'.trs(context),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Already a member?'.trs(context),
                          style: TextStyle(
                            fontSize: 17,
                            color: const Color(0x66000000),
                            letterSpacing: -0.41000000190734864,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Log In'.trs(context),
                            style: TextStyle(
                              fontSize: 17,
                              color: const Color(0xff67b500),
                              letterSpacing: -0.41000000190734864,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _branchContainer({String text, String image, bool selected}) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: selected ? Color(0x1a67b500) : Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kPrimaryColor,
                    ),
                    child: Center(child: SvgPicture.asset(image)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color(0xff1d3400),
                      letterSpacing: -0.24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  selected
                      ? SvgPicture.asset(
                          'assets/icons/Checkboxes – Ok - Accent.svg')
                      : SvgPicture.asset(
                          'assets/icons/Checkboxes – Radio - Empty White.svg',
                          color: Colors.black26,
                        ),
                  SizedBox(
                    width: 17,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
