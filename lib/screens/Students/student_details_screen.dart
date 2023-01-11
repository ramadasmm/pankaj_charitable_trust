import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Containers/container.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/screens/Students/students_list_screen.dart';
import 'package:pankaj_charitable_trust/screens/Students/student_update_screen.dart';

int? studentId;

class StudentDetailsScreen extends StatefulWidget {
  StudentDetailsScreen({
    super.key,
  });

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  bool studentDeleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget2(title: 'Recipient')),
        body: studentDeleted == false
            ? SingleChildScrollView(
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (context, value, child) {
                    final data = value;
                    final studentData = value[dataIndex!];

                    studentId = studentData.id;

                    return data.isNotEmpty
                        ? Container(
                            child: Column(
                              children: [
                                ContainerWidget(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, top: 20, bottom: 5),
                                        child: Text(
                                          'Recipient Details',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),

                                          //color: Colors.amber,
                                          child: Column(
                                            children: [
                                              StudentDetailsWidget(
                                                  heading: 'ID',
                                                  content: studentData.id
                                                      .toString()),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Name',
                                                  content: studentData.name
                                                      .toString()),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'SchoolID',
                                                  content: studentData.schooId),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'School',
                                                  content: studentData.school),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Course ID',
                                                  content:
                                                      studentData.courseId),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Course',
                                                  content: studentData.course),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'College ID',
                                                  content:
                                                      studentData.collegeId),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'College',
                                                  content: studentData.college),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Start Year',
                                                  content:
                                                      studentData.startYear),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Duration',
                                                  content:
                                                      studentData.duration),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Remarks',
                                                  content: studentData.remarks
                                                      .toString()),
                                              kHeight20,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                      style: const ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors.red)),
                                                      onPressed: () {
                                                        setState(() {
                                                          deleteStudent(
                                                              dataIndex!);

                                                          studentDeleted = true;
                                                        });
                                                      },
                                                      child:
                                                          const Text('Delete')),
                                                  ElevatedButton(
                                                      style: const ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors
                                                                      .deepPurple)),
                                                      onPressed: () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return StudentUpdateScreen(
                                                              studentDataIndex:
                                                                  dataIndex,
                                                            );
                                                          },
                                                        ));
                                                      },
                                                      child: Text('Edit'))
                                                ],
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text('Student Deleted');
                  },
                ),
              )
            : const Center(
                child: Text('Data Deleted'),
              ));
  }
}

class StudentDetailsWidget extends StatelessWidget {
  final String heading;
  final String content;
  const StudentDetailsWidget(
      {Key? key, required this.content, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(color: Colors.black45, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(content),
            ),
          )
        ],
      ),
    );
  }
}
