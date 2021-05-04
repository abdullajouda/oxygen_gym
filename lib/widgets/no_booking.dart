import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/services/Localization/localization.dart';
class NoBookingFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/images/no_booking.svg',height: 100,),
          Text(
            'No Bookings on this day.'.trs(context),
            style: TextStyle(
              fontSize: 24,
              color: kPrimaryColor,
              letterSpacing: 0.35000000190734865,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
