import 'package:flutter/material.dart';
import 'package:tasks_app/utils/constants.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Function validate;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    required this.validate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        validator: (value) {
          if(value == ""||value == null){
            return "please $hintText";
          }
          else if(hintText == "Enter your email"&&!validateEmail(value)){
            return "please enter valid email";
          }
          return null;
        },
        controller: textEditingController,
        decoration: InputDecoration(
          errorStyle: mainTextStyle,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16,color: Colors.black26),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
