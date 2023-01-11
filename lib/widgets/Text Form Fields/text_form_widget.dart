import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;

  TextFormWidget(
      {super.key,
      required this.hintText,
      this.keyboardType,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
    );
  }
}
