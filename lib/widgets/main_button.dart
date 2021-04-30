import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oxygen/constants.dart';

class MainButton extends StatelessWidget {
  final double height;
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onTap;
  final bool load;

  const MainButton(
      {Key key,
      this.height = 48,
      this.color = kPrimaryColor,
      this.textColor = Colors.white,
      this.title,
      this.onTap,
      this.load = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Center(
          child: load
              ? SpinKitRotatingCircle(
                  color: textColor,
                  size: 30,duration: Duration(milliseconds: 500),
                )
              : Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 17,
                    color: textColor,
                    letterSpacing: -0.41000000190734864,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
