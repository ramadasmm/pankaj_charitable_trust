import 'package:flutter/material.dart';

const List<String> list = <String>[
  'College1',
  'College2',
  'College3',
  'College4'
];
late String collegName;

class CollegeDropDownButton extends StatefulWidget {
  String? dropdownValue;
  CollegeDropDownButton({super.key, this.dropdownValue});

  @override
  State<CollegeDropDownButton> createState() => _CollegeDropDownButtonState();
}

class _CollegeDropDownButtonState extends State<CollegeDropDownButton> {
  String? dropdownValue = null;
  String hintText = 'Select College';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null) {
          return 'Select College';
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
      value: widget.dropdownValue,
      hint: Text(hintText),
      isExpanded: true,
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
        collegName = dropdownValue!;
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
