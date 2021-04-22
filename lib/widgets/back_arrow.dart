import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/services/Localization/lang_provider.dart';

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LangProvider().getLocaleCode() == 'ar'
        ? SvgPicture.asset('assets/icons/arrow_right.svg')
        : SvgPicture.asset('assets/icons/arrow_left.svg');
  }
}
