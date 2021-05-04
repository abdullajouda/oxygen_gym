import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:oxygen/components/reservation_card.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/history.dart';
import 'package:oxygen/widgets/delete_reservation_sheet.dart';
import 'package:oxygen/widgets/loader.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationHistory extends StatefulWidget {
  final VoidCallback openMenu;

  const ReservationHistory({Key key, this.openMenu}) : super(key: key);

  @override
  _ReservationHistoryState createState() => _ReservationHistoryState();
}

class _ReservationHistoryState extends State<ReservationHistory> {
  List<HistoryModel> _items = [];
  bool load = true;

  getHistory() async {
    setState(() {
      load = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var request = await get(Constants.apiURl + 'getMyOrders', headers: {
      'Accept': 'application/json',
      'Accept-Language': LangProvider().getLocaleCode(),
      'Authorization': 'Bearer ${prefs.getString('userToken')}',
    });
    var response = json.decode(request.body);
    List rs = response['items'];
    rs.forEach((element) {
      HistoryModel slider = HistoryModel.fromJson(element);
      _items.add(slider);
    });
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                MenuButton(
                  onTap: widget.openMenu,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width * .75),
                  child: Text(
                    'Reservation History'.trs(context),
                    style: TextStyle(
                      fontSize: 32,
                      color: const Color(0xff1d3400),
                      letterSpacing: 0.38588235473632815,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: load?Loader():ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
              child: ReservationCard(
                type: _items[index].type,
                model: _items[index],
                remove: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    enableDrag: true,
                    isScrollControlled: true,
                    builder: (context) => DeleteReservation(model: _items[index],),
                  ).then((value) {
                    _items.clear();
                    getHistory();
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
