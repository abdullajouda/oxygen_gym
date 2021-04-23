import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/widgets/main_button.dart';

class LogOutSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SvgPicture.asset(
                  'assets/icons/logout.svg',
                  height: 28,
                  width: 34,
                ),
              ),
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 40,
                  color: const Color(0xff1d3400),
                  letterSpacing: 0.41000000000000003,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              'Are you sure about logout Oxogen App? Thank you for using us ❤️',
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
              title: 'Logout',
            ),
          )
        ],
      ),
    );
  }
}
