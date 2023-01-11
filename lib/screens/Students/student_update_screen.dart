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

            final updateStudentId = studentData.id;

            schoolName = studentData.school;
            collegName = studentData.college;
            courseName = studentData.course;
            year = studentData.startYear;

            TextEditingController nameController =
                TextEditingController(text: studentData.name);
            TextEditingController activeController =
                TextEditingController(text: studentData.active);
            TextEditingController schoolIdControlller =
                TextEditingController(text: studentData.schooId);
            TextEditingController collegeIdController =
                TextEditingController(text: studentData.collegeId);
            TextEditingController courseIdController =
                TextEditingController(text: studentData.courseId);
            TextEditingController durationController =
                TextEditingController(text: studentData.duration);
            TextEditingController remarksController =
                TextEditingController(text: studentData.remarks);

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
                              'SchoolId:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                              hintText: 'Enter Schoold',
                              controller: schoolIdControlller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter student Name';
                                }
                              }),
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
                              'CollegeId:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                              hintText: 'Enter CollegeId',
                              controller: collegeIdController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter collegId';
                                }
                              }),
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
                              'course Id:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                              hintText: 'Enter courseID',
                              controller: courseIdController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter courseId';
                                }
                              }),
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
                              'Start Year:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: YearDropDownButton(
                                dropdownValue: studentData.startYear,
                              )),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Duration:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                              hintText: 'Enter Duration',
                              controller: durationController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Duration';
                                }
                              }),
                          kHeight20,
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Remarks:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          kHeight10,
                          TextFormWidget(
                              hintText: 'Enter Remarks',
                              controller: remarksController,
                              validator: (value) {}),
                          kHeight30,
                          Center(
                              child: InkWell(
                                  onTap: () async {
                                    final _student = StudentModel(
                                        name: nameController.text,
                                        active: activeController.text,
                                        startYear: year,
                                        school: schoolName,
                                        schooId: schoolIdControlller.text,
                                        college: collegName,
                                        collegeId: collegeIdController.text,
                                        course: courseName,
                                        remarks: remarksController.text,
                                        courseId: courseIdController.text,
                                        duration: durationController.text);

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
