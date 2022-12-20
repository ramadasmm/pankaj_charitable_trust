import 'package:flutter/material.dart';

class SearchTextFormField extends StatefulWidget {
  String hintText;
  TextEditingController controller;

  String? Function(String?)? validator;

  SearchTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 1,
      cursorHeight: 20,
      cursorColor: Colors.black45,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.only(left: 20),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
        ),
      ),
    );
  }
}
