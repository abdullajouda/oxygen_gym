import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/main_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'auth/register.dart';
import 'auth/sign_in.dart';

class SelectBranch extends StatefulWidget {
  @override
  _SelectBranchState createState() => _SelectBranchState();
}

class _SelectBranchState extends State<SelectBranch> {
  bool men = true;
  bool women = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Direction(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/branchBackGround.png',
                height: size.height,
                fit: BoxFit.fitHeight,
              ),
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                      colors: [const Color(0x00000000), const Color(0xcc000000)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SvgPicture.asset('assets/images/logo.svg'),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Step 1'.trs(context),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: const Color(0x99ffffff),
                                          letterSpacing: -0.24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Select Branch'.trs(context),
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: const Color(0xffffffff),
                                          letterSpacing: 0.33764708709716795,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    women = false;
                                    men = true;
                                  });
                                },
                                child: _branchContainer(
                                    image: 'assets/icons/Flame.svg',
                                    text: 'Men Branch'.trs(context),
                                    selected: men),
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
                                child: _branchContainer(
                                    image: 'assets/icons/Heart.svg',
                                    text: 'Women Branch'.trs(context),
                                    selected: women),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: MainButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignIn(
                                            gender: men ? 1 : 2,
                                          ),
                                        ));
                                  },
                                  height: 50,
                                  title: 'Log In'.trs(context),
                                  color: Colors.white,
                                  textColor: kPrimaryColor,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 15),
                              //   child: MainButton(
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) => Register(gender: men ? 1 : 2,),
                              //           ));
                              //     },
                              //     height: 50,
                              //     title: 'Registration'.trs(context),
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _branchContainer({String text, String image, bool selected}) {
    return ClipRect(
      child: BackdropFilter(
        filter: selected
            ? ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0)
            : ImageFilter.blur(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: selected ? Color(0x2fffffff) : Colors.transparent,
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
                      color: const Color(0xff000000),
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
                      color: const Color(0xffffffff),
                      letterSpacing: -0.24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(selected
                      ? 'assets/icons/Checkboxes – Ok - Accent.svg'
                      : 'assets/icons/Checkboxes – Radio - Empty White.svg'),
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
