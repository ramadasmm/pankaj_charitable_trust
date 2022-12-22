import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/database/models/student_model.dart';
import 'package:pankaj_charitable_trust/screens/Students/student_details_screen.dart';
import 'package:pankaj_charitable_trust/screens/Trustees/add_trustee_screen.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';

import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/password_widget.dart';

import 'add_student_screen.dart';

int? dataIndex;

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget2(title: 'Students')),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (context, value, child) {
              final data = value;

              return Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black26,
                        offset: Offset(4, 2))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 0),
                      child: Text(
                        'Students Details',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 10),
                      child: Text(
                        '${data.length} Students',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SearchTextFormField(
                        hintText: 'Search Student',
                        controller: TextEditingController(),
                        validator: (p0) {},
                      ),
                    ),
                    Flexible(
                        child: data.isNotEmpty
                            ? ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final data = value[index];

                                  return ListTile(
                                    onTap: () {
                                      dataIndex = index;

                                      if (data.id != null) {
                                        getStudent(dataIndex!);

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return StudentDetailsScreen();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    title: Text(data.name),
                                    subtitle: Text(data.email),
                                    trailing: Text(
                                      'Year: ${data.year}',
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    height: 5,
                                    thickness: 1,
                                  );
                                },
                                itemCount: value.length)
                            : const Center(
                                child: Text('No Students'),
                              ))
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AddStudentScreen();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
