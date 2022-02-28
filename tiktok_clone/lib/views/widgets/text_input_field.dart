import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.labelText,
      required this.isObscure})
      : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: borderColor)),
      ),
      obscureText: isObscure,
    );
  }
}
