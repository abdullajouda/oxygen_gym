import 'package:flutter/material.dart';

class MenuItem {
  String title;
  bool isSelected;
  String icon;
  int id;
  StatefulWidget body;

  MenuItem({this.title, this.isSelected, this.icon, this.id, this.body});
}
