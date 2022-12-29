import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/database/models/student_model.dart';

import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/address_text_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/number_text_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/text_form_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Buttons/app_button.dart';
import 'package:pankaj_charitable_trust/screens/Students/students_list_screen.dart';

import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/college_drop_down.dart';
import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/course_drop_down_button.dart';
import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/school_drop_down.dart';

import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/year_drop_down_botton.dart';

class StudentUpdateScreen extends StatefulWidget {
  int? studentDataIndex;

  StudentUpdateScreen({super.key, this.studentDataIndex});

  @override
  State<StudentUpdateScreen> createState() => _StudentUpdateScreenState();
}

class _StudentUpdateScreenState extends State<StudentUpdateScreen> {
  checkSave() {}

  @override
  Widget build(BuildContext context) {
    getStudent(widget.studentDataIndex!);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Student'),
          titleSpacing: 0,
        ),
        body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (context, value, child) {
            final studentData = value[widget.studentDataIndex!];

            schoolName = studentData.school;
            collegName = studentData.college;
            courseName = studentData.course;
            year = studentData.year;

            TextEditingController nameController =
                TextEditingController(text: studentData.name);
            TextEditingController emailController =
                TextEditingController(text: studentData.email);
            TextEditingController numberController =
                TextEditingController(text: studentData.number);
            TextEditingController addressController =
                TextEditingController(text: studentData.address);
            final formKey = GlobalKey<FormState>();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    //height: 600,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(4, 2))
                        ]),
                    child: Form(
                      //autovalidateMode: AutovalidateMode.always,
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Name:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                              hintText: 'Enter student Name',
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter student Name';
                                }
                              }),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Email:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                            hintText: 'Enter  Email',
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your Email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please Enter valid Email';
                              }
                            },
                          ),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Phone:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          NumberTextWidget(
                              hintText: 'Enter Number',
                              controller: numberController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter your Number';
                                } else if (!RegExp(
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                    .hasMatch(value)) {
                                  return 'Enter valid number';
                                }
                              }),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Address:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          AddressTextField(
                            hintText: 'Enter Address',
                            controller: addressController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Address';
                              } else if (!RegExp(r'(^[#.0-9a-zA-Z\s,-]+$)')
                                  .hasMatch(value)) {
                                return 'Enter correct number';
                              }
                            },
                          ),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'School:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: SchoolDropDownButton(
                                dropdownValue: studentData.school,
                              )),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'College:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: CollegeDropDownButton(
                                dropdownValue: studentData.college,
                              )),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Course:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: CourseDropDownButton(
                                dropdownValue: studentData.course,
                              )),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Year:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: YearDropDownButton(
                                dropdownValue: studentData.year,
                              )),
                          kHeight30,
                          Center(
                              child: InkWell(
                                  onTap: () async {
                                    final sName = nameController.text;
                                    final sEmail = emailController.text;
                                    final sNumber = numberController.text;
                                    final sAddress = addressController.text;

                                    final _student = StudentModel(
                                      name: sName,
                                      email: sEmail,
                                      number: sNumber,
                                      address: sAddress,
                                      school: schoolName,
                                      college: collegName,
                                      course: courseName,
                                      year: year,
                                    );

                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();

                                      await updateStudent(
                                          _student, widget.studentDataIndex!);

                                      Navigator.of(context).pop();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          margin: EdgeInsets.all(10),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 1),
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('Same user already exist'),
                                        ),
                                      );
                                    }
                                  },
                                  child: AppButton(text: 'Update')))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
