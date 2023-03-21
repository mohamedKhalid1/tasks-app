import 'package:flutter/material.dart';

Color mainColor = const Color(0xff3fbfbf);
Color backgroundColor = const Color(0xfff0f0f0);
TextStyle mainTextStyleBold = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Joan-Regular');
TextStyle mainTextStyle =
    const TextStyle(fontSize: 18, fontFamily: 'Joan-Regular');
TextStyle mainTextStyleBoldBig = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.white,
    fontFamily: 'Joan-Regular');

getSnackBar(context, String title, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title),
    backgroundColor: color,
  ));
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}
