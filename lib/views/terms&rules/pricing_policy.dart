import 'package:flutter/material.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:provider/provider.dart';

class PricingPolicy extends StatefulWidget {
  final VoidCallback openMenu;

  const PricingPolicy({Key key, this.openMenu}) : super(key: key);

  @override
  _PricingPolicyState createState() => _PricingPolicyState();
}

class _PricingPolicyState extends State<PricingPolicy> {
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
    Size size = MediaQuery.of(context).size;
    var set = Provider.of<SettingsOperation>(context);
    return Direction(
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    MenuButton(
                      onTap: widget.openMenu,
                    ),
                    Text(
                      'Pricing Policy'.trs(context),
                      style: TextStyle(
                        fontSize: 32,
                        color: const Color(0xff1d3400),
                        letterSpacing: 0.38588235473632815,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child: Center(child: Image.network(set.settingsModel.pricingImg,))),
            )
          ],
        ),
      ),
    );
  }
}
