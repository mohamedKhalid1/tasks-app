import 'package:flutter/material.dart';
import 'package:tasks_app/utils/constants.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Function()? onTapped;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    this.onTapped,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        maxLines: hintText == "Enter your Task description" ? 3 : 1,
        readOnly: hintText == "Enter your Task date" ||
                hintText == "Enter your Task time"
            ? true
            : false,
        onTap: onTapped,
        validator: (value) {
          if (value == "" || value == null) {
            return "please $hintText";
          } else if (hintText == "Enter your password" && value.length < 6) {
            return "Password should be at least 6 characters";
          }
          return null;
        },
        controller: textEditingController,
        decoration: InputDecoration(
          errorStyle: mainTextStyle,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.black26),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
