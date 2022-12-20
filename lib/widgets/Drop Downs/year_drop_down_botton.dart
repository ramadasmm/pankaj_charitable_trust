import 'package:flutter/material.dart';

const List<String> list = <String>['1', '2', '3', '4'];

late String year;

class YearDropDownButton extends StatefulWidget {
  const YearDropDownButton({super.key});

  @override
  State<YearDropDownButton> createState() => _yearDropDownButtonState();
}

class _yearDropDownButtonState extends State<YearDropDownButton> {
  String? dropdownValue = null;
  String hintText = 'Select Year';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null) {
          return 'Select year';
        }
      },

      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.deepPurple),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: InputBorder.none),

      hint: Text(hintText),
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
        size: 30,
        color: Colors.black,
      ),
      elevation: 0,
      style: const TextStyle(color: Colors.black),
      // underline: Container(
      //   color: Colors.white,
      // ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
        year = dropdownValue!;
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
