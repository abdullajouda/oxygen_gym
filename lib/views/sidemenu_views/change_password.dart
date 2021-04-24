import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/views/auth/forgot_password.dart';
import 'package:oxygen/widgets/main_button.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';

class ChangePassword extends StatefulWidget {
  final VoidCallback openMenu;

  const ChangePassword({Key key, this.openMenu}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
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
                  'Change password'.trs(context),
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
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      height: 18.33,
                      width: 18.33,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff67b500),
                      ),
                    ),
                    SizedBox(
                      width: 5.2,
                    ),
                    Container(
                      height: 18.33,
                      width: 18.33,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff67b500),
                      ),
                    ),
                    SizedBox(
                      width: 5.2,
                    ),
                    Container(
                      height: 18.33,
                      width: 18.33,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff67b500),
                      ),
                    ),
                    SizedBox(
                      width: 5.2,
                    ),
                    Container(
                      height: 18.33,
                      width: 18.33,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff67b500),
                      ),
                    ),
                    SizedBox(
                      width: 5.2,
                    ),
                    Container(
                      height: 18.33,
                      width: 18.33,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff67b500),
                      ),
                    ),
                    SizedBox(
                      width: 5.2,
                    ),
                    SvgPicture.asset('assets/icons/lock.svg')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        // controller: password,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: fieldDecoration('Old Password'.trs(context)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        // controller: password,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: fieldDecoration('New Password'.trs(context)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        // controller: password,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: fieldDecoration('Confirm Password'.trs(context)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MainButton(
                  title: 'Change Password'.trs(context),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ));
                  },
                  child: Text(
                    'Forget my Old password?'.trs(context),
                    style: TextStyle(
                      fontSize: 17,
                      color: const Color(0xff67b500),
                      letterSpacing: -0.41000000190734864,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
