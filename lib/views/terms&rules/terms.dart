import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:provider/provider.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  ScrollController _controller;
  double _value = 0.0;

  void _scrollListener() {
    setState(() {
      _value = _controller.offset;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var set = Provider.of<SettingsOperation>(context);
    Size size = MediaQuery.of(context).size;
    return Direction(
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
                child: Row(
              children: [
                MyBackButton(),
              ],
            )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: Text(
                    'Terms of Service'.trs(context),
                    style: TextStyle(
                      fontSize: 34,
                      color: const Color(0xff1d3400),
                      letterSpacing: 0.41000000190734864,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                height: _value != 0
                    ? 162 - _value >= 120
                        ? 162 - _value
                        : 120
                    : 162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xff67b500),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${'Welcome,Check Our'.trs(context)} ${'Terms of Service'.trs(context)}',
                        style: TextStyle(
                          fontSize: 22 - (_value) >= 16 ? 22 - (_value) : 16,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.35000000190734865,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Oxygen gym Administration'.trs(context),
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0x661d3400),
                          letterSpacing: -0.24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView(
              controller: _controller,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Html(
                      data: set.settingsModel.terms.description
                              .replaceAll("\\r\\n", '') ??
                          '',
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
