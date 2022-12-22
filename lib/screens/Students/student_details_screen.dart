import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Containers/container.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/screens/Students/students_list_screen.dart';
import 'package:pankaj_charitable_trust/screens/Students/update_screen.dart';

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
    getStudent(dataIndex!);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget2(title: 'StudentName')),
        body: studentDeleted == false
            ? SingleChildScrollView(
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (context, value, child) {
                    final data = value;
                    final studentData = value[dataIndex!];

                    print(studentData.id);

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
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),

                                          //color: Colors.amber,
                                          child: Column(
                                            children: [
                                              StudentDetailsWidget(
                                                  heading: 'Name',
                                                  content: studentData.name),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Email',
                                                  content: studentData.email),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Address',
                                                  content: studentData.address),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Address',
                                                  content: studentData.school),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Course',
                                                  content: studentData.course),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'College',
                                                  content: studentData.college),
                                              kHeight20,
                                              StudentDetailsWidget(
                                                  heading: 'Year',
                                                  content: studentData.year),
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
                                                              studentData.id!);

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
                                                              dataIndex:
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
