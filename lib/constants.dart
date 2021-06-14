
import 'package:flutter/material.dart';
import 'package:oxygen/services/Localization/localization.dart';
const kPrimaryColor = Color(0xff67b500);

class Constants {
  static const String langKey = 'langKey';

  static const String apiURl = 'http://beinlive.co/api/';
}


class FieldValidator {
  static String validate(String value, context) {
    if (value.isEmpty) {
      return  '* Required'.trs(context);
    }
    return null;
  }
}


InputDecoration fieldDecoration(hint) {
  return InputDecoration(
    fillColor: Color(0x14000000),
    filled: true,
    contentPadding: EdgeInsets.only(top: 12,bottom: 12,right: 12,left: 12),
    hintText: hint,
    errorStyle: TextStyle(
      fontSize: 17,
      letterSpacing: -0.41000000190734864,
      color: Colors.redAccent,
    ),
    hintStyle: TextStyle(
      fontSize: 17,
      color: const Color(0x66000000),
      letterSpacing: -0.41000000190734864,
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(8.0),
        borderSide: BorderSide( width: 1.0,
            color: const Color(0xffe3e7eb))
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(8.0),
        borderSide: BorderSide( width: 1.0,
            color: const Color(0xffe3e7eb))
    ),
    border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(8.0),
        borderSide: BorderSide( width: 1.0,
            color: const Color(0xffe3e7eb))
    ),
  );
}