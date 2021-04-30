
import 'package:flutter/material.dart';
import 'package:oxygen/services/Localization/localization.dart';
const kPrimaryColor = Color(0xff67b500);

class Constants {
  static const String langKey = 'langKey';

  static const String apiURl = 'https://beinlive.co/api/';


  static const String token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImVlMWRlOTQxM2MyMDIyNGU2NGJiMGYwNDQ3NDI1MDYxNGY2ZTUyMDBjYmM4YTQ0MDAzODRjNzM4ZGE2YjFmNDdjNzJjYjVlMTE2OWMwMjUzIn0.eyJhdWQiOiIxIiwianRpIjoiZWUxZGU5NDEzYzIwMjI0ZTY0YmIwZjA0NDc0MjUwNjE0ZjZlNTIwMGNiYzhhNDQwMDM4NGM3MzhkYTZiMWY0N2M3MmNiNWUxMTY5YzAyNTMiLCJpYXQiOjE2MTk3Mzg3MjcsIm5iZiI6MTYxOTczODcyNywiZXhwIjoxNjUxMjc0NzI3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.YWJFgZIeY72fghjfWpfgBOgv7IX5CBLpAenvZTRo3iaDy-VUDqUhOUoPP-aMG2Mn4fqdfVy8TEFeJWXE5QT4nI2Nh6k_D_sYViJhmifFmjH-jQSDz54muTsetHk7NipPj2cUy-62Eb4K3Yff7HtH-AYn85BvfkUK0O4Bsp7YceHoxjGHiPwPWISQcr0EJslQN1eMfrPxvK4E2XoTaT4XJ7OMf8VSxpHyicd6SXRXcYh_CGiX-T54BM6gxS676p4x7Mv_rYgnYiS6-cknBmgeks_5iC7gW3uW0Ba-qlcfZ2fck3bMSPzRF8okuqXuaKyctAI3ClTSeL0fnWMtu2v-fEVKK-TBDgQmsIC2RMFaO-9xyzAqCSvPFdMIEmk9vynRRk5qHMOz9BzoWDUWpheaPH3KiNsNp_q7eziC-pTcWPxqt4bwvcHbw-ZHKbIgXch1ONv1XHS4F3DB_E_Z2ndgZV_Ir8hDaAvVcEizpm36Abeac9syeXvlr0Zs4WA07D0BqS5Wp0lMfMQrLSZ8SZnIm5q91UNqhsJwg1JgmlJ9tTsuI3V6DGyqbDJ6Sth5M2bcQ86HBJZOA4kBsjIC5M_WqM1zQtSrKQzKnj5YObYyZXTd6GgbrmQZtVL_a4sKLjnaFhr8abB4OluAz90rcOCrHmCeAWNnUi2SX_Z3f3sUx1M';

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