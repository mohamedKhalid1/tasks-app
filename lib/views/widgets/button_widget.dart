import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.onPress, required this.text})
      : super(key: key);
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 66,
      width: double.infinity,
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: Text(
          text,
          style: mainTextStyleBoldBig,
        ),
      ),
    );
  }
}
