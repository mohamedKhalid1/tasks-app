import 'package:flutter/material.dart';

Color mainColor = const Color(0xff3fbfbf);
Color backgroundColor = const Color(0xfff0f0f0);
TextStyle mainTextStyleBold =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
TextStyle mainTextStyle = const TextStyle(fontSize: 18);
TextStyle mainTextStyleBoldBig = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white);
getSnackBar(context, String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(title),
        backgroundColor: color,
    ));
}