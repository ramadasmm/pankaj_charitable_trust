import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Containers/container.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';

class StudentDetailsScreen extends StatefulWidget {
  int id;
  StudentDetailsScreen({super.key, required this.id});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    getStudent(widget.id);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget2(title: 'StudentName')),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (context, value, child) {
          final data = value;
          final studentData = value[widget.id];

          return widget.id != null
              ? Container(
                  child: Column(
                    children: [
                      ContainerWidget(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 20, top: 20, bottom: 5),
                              child: Text(
                                'Profile Details',
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
                                    left: 20, right: 20, top: 10, bottom: 10),

                                //color: Colors.amber,
                                child: Column(
                                  children: [
                                    StudentDetailsWidget(
                                      heading: 'Name',
                                      content: studentData.id != null
                                          ? studentData.name
                                          : 'Student Not found',
                                    ),
                                    kHeight20,
                                    StudentDetailsWidget(
                                      heading: 'Email',
                                      content: studentData.id != null
                                          ? studentData.email
                                          : 'Student Not found',
                                    ),
                                    kHeight20,
                                    StudentDetailsWidget(
                                      heading: 'Address',
                                      content: studentData.id != null
                                          ? studentData.address
                                          : 'Student Not found',
                                    ),
                                    kHeight20,
                                    StudentDetailsWidget(
                                      heading: 'Course',
                                      content: studentData.id != null
                                          ? studentData.course
                                          : 'Student Not found',
                                    ),
                                    kHeight20,
                                    StudentDetailsWidget(
                                      heading: 'College',
                                      content: studentData.id != null
                                          ? studentData.college
                                          : 'Student Not found',
                                    ),
                                    kHeight20,
                                    StudentDetailsWidget(
                                      heading: 'Year',
                                      content: studentData.id != null
                                          ? studentData.year
                                          : 'Student Not found',
                                    ),
                                    kHeight20,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red)),
                                            onPressed: () {
                                              setState(() {
                                                deleteStudent(studentData.id!);
                                              });
                                            },
                                            child: const Text('Delete')),
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.deepPurple)),
                                            onPressed: () {},
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
              : Text('Student Not Details not Available');
        },
      ),
    );
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
