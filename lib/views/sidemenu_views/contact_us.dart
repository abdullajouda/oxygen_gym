import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/main_button.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  final VoidCallback openMenu;

  const ContactUs({Key key, this.openMenu}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool load = false;
  TextEditingController name, mobile, email, message;
  send() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        load = true;
      });
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      var request = await post(Constants.apiURl + 'contactUs', body: {
        'name': name.text,
        'email': email.text,
        'mobile': mobile.text,
        'message': message.text,
      }, headers: {
        'Accept': 'application/json',
        'Accept-Language': LangProvider().getLocaleCode(),
      });
      var response = json.decode(request.body);
      Fluttertoast.showToast(msg: response['message']);

    }
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    name = TextEditingController();
    mobile = TextEditingController();
    email = TextEditingController();
    message = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    mobile.dispose();
    email.dispose();
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var set = Provider.of<SettingsOperation>(context);
    return Direction(
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    MenuButton(
                      onTap: widget.openMenu,
                    ),
                    Text(
                      'Contact Us'.trs(context),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: name,
                            validator: (value) =>
                                FieldValidator.validate(value, context),
                            decoration: fieldDecoration('Name'.trs(context)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: mobile,
                            validator: (value) =>
                                FieldValidator.validate(value, context),
                            decoration: fieldDecoration('Mobile'.trs(context)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: email,
                            validator: (value) =>
                                FieldValidator.validate(value, context),
                            decoration: fieldDecoration('Email'.trs(context)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: message,
                            maxLines: 4,
                            validator: (value) =>
                                FieldValidator.validate(value, context),
                            decoration: fieldDecoration('Message'.trs(context)),
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
                      onTap: () {
                        send();
                      },
                      load: load,
                      title: 'Send'.trs(context),
                    ),
                  )],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
