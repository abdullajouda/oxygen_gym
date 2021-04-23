import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/views/auth/forgot_password.dart';
import 'file:///C:/Users/histo/IdeaProjects/oxygen/lib/views/sidemenu_views/main_page.dart';
import 'package:oxygen/views/root_page.dart';
import 'package:oxygen/widgets/back_arrow.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/widgets/main_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController name, password;

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
                  SvgPicture.asset('assets/images/colored_logo.svg'),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Log in to Your Account',
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
                      decoration: fieldDecoration('Username'),
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
                      decoration: fieldDecoration('Password'),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MainButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage(),));
                      },
                      title: 'Log In',
                    ),
                  )
                ],
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
                    'Forgot your password?',
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
    );
  }
}
