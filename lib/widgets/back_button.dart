import 'package:flutter/material.dart';

import 'back_arrow.dart';
import 'package:oxygen/services/Localization/localization.dart';

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              BackArrow(),
              SizedBox(
                width: 5,
              ),
              Text(
                'Back'.trs(context),
                style: TextStyle(
                  fontSize: 17,
                  color: const Color(0xff67b500),
                  letterSpacing: -0.41000000190734864,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
