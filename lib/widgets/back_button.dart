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
          child: BackArrow(),
        ),
      ),
    );
  }
}
