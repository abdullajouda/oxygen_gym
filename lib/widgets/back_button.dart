import 'package:flutter/material.dart';

import 'back_arrow.dart';

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        width: 80,
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
                'Back',
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
