import 'package:flutter/material.dart';
import 'package:oxygen/services/Localization/localization.dart';

class Direction extends StatelessWidget {
  final Widget child;

  const Direction({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: LangProvider().getLocaleCode() == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: child);
  }
}
