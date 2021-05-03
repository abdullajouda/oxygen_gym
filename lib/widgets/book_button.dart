import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oxygen/services/Localization/localization.dart';

class BookButton extends StatefulWidget {
  final int available;
  final int currentOrders;
  final VoidCallback book;
  final bool load;

  const BookButton(
      {Key key,
      this.available,
      this.currentOrders,
      this.book,
      this.load = false,})
      : super(key: key);

  @override
  _BookButtonState createState() => _BookButtonState();
}

class _BookButtonState extends State<BookButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.available - widget.currentOrders != 0) widget.book.call();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
          color: widget.available - widget.currentOrders == 0
              ? Color(0xffc6c6c6)
              : Color(0xff67b500),
        ),
        child: widget.load
            ? Center(
                child: SpinKitFadingCircle(
                  color: Colors.white,
                  size: 20,
                ),
              )
            : Center(
                child: widget.available - widget.currentOrders == 0
                    ? Text(
                        'Class Full'.trs(context),
                        style: TextStyle(
                          fontSize: 17,
                          color: const Color(0xffffffff),
                          letterSpacing: -0.41000000190734864,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Text(
                        'Book Now'.trs(context),
                        style: TextStyle(
                          fontSize: 17,
                          color: const Color(0xffffffff),
                          letterSpacing: -0.41000000190734864,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
      ),
    );
  }
}
