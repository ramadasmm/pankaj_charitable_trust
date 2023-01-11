import 'package:flutter/material.dart';
import 'package:pankaj_charitable_trust/api/base_client.dart';
import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/database/models/student_model.dart';
import 'package:pankaj_charitable_trust/Widgets/Buttons/app_button.dart';
import 'package:pankaj_charitable_trust/models/recipients/recipients_model.dart';

import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/college_drop_down.dart';
import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/course_drop_down_button.dart';

import 'package:pankaj_charitable_trust/widgets/Drop%20Downs/year_drop_down_botton.dart';

import '../../Widgets/Drop Downs/school_drop_down.dart';
import '../../widgets/Text Form Fields/text_form_widget.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({
    super.key,
  });
  TextEditingController nameController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  TextEditingController schoolIdControlller = TextEditingController();
  TextEditingController collegeIdController = TextEditingController();

  TextEditingController courseIdController = TextEditingController();
  TextEditingController activeController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  checkSave() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const PreferredSize(
        //     preferredSize: Size.fromHeight(60),
        //     child: AppBarWidget(
        //       title: 'Add Student',
        //     )),

        appBar: AppBar(
          title: Text('Add Student'),
          titleSpacing: 0,
        ),
        body: SingleChildScrollView(
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
                      kHeight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'School ID:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          keyboardType: TextInputType.number,
                          hintText: 'Enter school id',
                          controller: schoolIdControlller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter school id';
                            }
                          }),
                      kHeight10,
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
                          child: SchoolDropDownButton()),
                      kHeight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'collegeId:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          keyboardType: TextInputType.number,
                          hintText: 'Enter college id',
                          controller: collegeIdController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter college id';
                            }
                          }),
                      kHeight10,
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
                          child: CollegeDropDownButton()),
                      kHeight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'CourseId:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          keyboardType: TextInputType.number,
                          hintText: 'Enter course id',
                          controller: courseIdController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter courseId';
                            }
                          }),
                      kHeight10,
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
                          child: CourseDropDownButton()),
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
                          child: YearDropDownButton()),
                      kHeight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Active:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          keyboardType: TextInputType.number,
                          hintText: 'Active',
                          controller: activeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '*Required';
                            }
                          }),
                      kHeight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Duration:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          keyboardType: TextInputType.number,
                          hintText: 'Duration',
                          controller: durationController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '*Required';
                            }
                          }),
                      kHeight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Remarks:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          hintText: 'Remarks',
                          controller: remarksController,
                          validator: (value) {}),
                      kHeight30,
                      Center(
                          child: InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  print(remarksController.text);

                                  final _student = StudentModel(
                                      name: nameController.text,
                                      startYear: year,
                                      school: schoolName,
                                      schooId: schoolIdControlller.text,
                                      college: collegName,
                                      collegeId: collegeIdController.text,
                                      course: courseName,
                                      courseId: '1',
                                      remarks: remarksController.text,
                                      active: activeController.text,
                                      duration: durationController.text);

                                  // var recipient = Datum(
                                  //   id: 222,
                                  //   name: nameController.text,
                                  //   // school: schoolName,
                                  //   // college: collegName,
                                  //   // startYear: 5,
                                  // );

                                  // BaseClient().postRecipient(recipient);

                                  addStudent(_student);

                                  Navigator.of(context).pop();
                                } else {}
                              },
                              child: const AppButton(text: 'Save')))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
