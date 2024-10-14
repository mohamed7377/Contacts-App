import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  double width;
  TextEditingController tController;
  String title;
  IconData textIcon;
  TextInputType textInput;
  String? Function(String?) validator;
  TextInput(
      {required this.width,
      required this.title,
      required this.tController,
      required this.textIcon,
      required this.textInput,
      required this.validator
      });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInput,
      controller: tController,
      validator:validator ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.09 * width),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: title,
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 0.05 * width,
            color: Colors.black),
        suffixIcon: Icon(textIcon),
        suffixIconColor: Colors.blueAccent,
      ),
    );
    ;
  }
}
