import 'package:flutter/material.dart';

const List<String> list = <String>['School1', 'School2', 'School3', 'School4'];

late String schoolName;

class SchoolDropDownButton extends StatefulWidget {
  const SchoolDropDownButton({
    super.key,
  });

  @override
  State<SchoolDropDownButton> createState() => _schoolDropDownButtonState();
}

class _schoolDropDownButtonState extends State<SchoolDropDownButton> {
  String? dropdownValue = null;
  String hintText = 'Select School';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null) {
          return 'Select School';
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
        schoolName = dropdownValue!;
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
