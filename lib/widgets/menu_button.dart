import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onTap;

  const MenuButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        height: 40,
        width: 40,
        child: Icon(
          Icons.menu,
          size: 30,
          color: Color(0xff1d3400),
        ),
      ),
    );
  }
}
