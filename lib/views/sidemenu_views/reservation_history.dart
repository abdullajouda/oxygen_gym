import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen/components/reservation_card.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/widgets/menu_button.dart';

class ReservationHistory extends StatefulWidget {
  final VoidCallback openMenu;

  const ReservationHistory({Key key, this.openMenu}) : super(key: key);

  @override
  _ReservationHistoryState createState() => _ReservationHistoryState();
}

class _ReservationHistoryState extends State<ReservationHistory> {
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
                    'Reservation History',
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
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
              child: ReservationCard(type: 3,),
            ),
          ),
        )
      ],
    );
  }
}
