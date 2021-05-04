import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/history.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'directions.dart';
import 'main_button.dart';

class DeleteReservation extends StatefulWidget {
  final HistoryModel model;

  const DeleteReservation({Key key, this.model}) : super(key: key);

  @override
  _DeleteReservationState createState() => _DeleteReservationState();
}

class _DeleteReservationState extends State<DeleteReservation> {
  bool load = false;

  delete() async {
    setState(() {
      load = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await get(Constants.apiURl + 'deleteOrder/${widget.model.id}',
        headers: {
          'Accept': 'application/json',
          'Accept-Language': LangProvider().getLocaleCode(),
          'Authorization': 'Bearer ${prefs.getString('userToken')}',
        });
    var response = json.decode(request.body);
    if (response['status'] == true) {
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: response['message']);
    }
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Direction(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x26000000),
              offset: Offset(0, 14),
              blurRadius: 18,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 25),
              child: Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: const Color(0x33000000),
                ),
              ),
            ),
            Text(
              'Delete'.trs(context),
              style: TextStyle(
                fontSize: 40,
                color: const Color(0xff1d3400),
                letterSpacing: 0.41000000000000003,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Are you sure you want to delete this reservation?'.trs(context),
                style: TextStyle(
                  fontSize: 17,
                  color: const Color(0xff000000),
                  letterSpacing: -0.41000000190734864,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
              child: MainButton(
                color: Color(0xffff4d4d),
                load: load,
                onTap: () => delete(),
                title: 'Delete'.trs(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
