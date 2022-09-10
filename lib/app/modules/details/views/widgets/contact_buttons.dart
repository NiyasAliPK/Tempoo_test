import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactButtons extends GetView {
  final IconData icon;
  final Color color;
  final Color iconColor;

  ContactButtons(
      {required this.icon, required this.color, this.iconColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: iconColor,
          )),
    );
  }
}
