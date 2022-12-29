import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Containers/container.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/screens/Students/students_list_screen.dart';
import 'package:pankaj_charitable_trust/screens/Students/student_update_screen.dart';
import 'package:pankaj_charitable_trust/screens/Trustees/trustee_update_screen.dart';
import 'package:pankaj_charitable_trust/screens/Trustees/trustees_list_screen.dart';

int? trusteeId;

class TrusteeDetailsScreen extends StatefulWidget {
  TrusteeDetailsScreen({
    super.key,
  });

  @override
  State<TrusteeDetailsScreen> createState() => _TrusteeDetailsScreenState();
}

class _TrusteeDetailsScreenState extends State<TrusteeDetailsScreen> {
  bool trusteeDataDeleted = false;
  @override
  Widget build(BuildContext context) {
    getTrustee(trusteeIndex!);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget2(title: 'TrusteeDetails')),
        body: trusteeDataDeleted == false
            ? SingleChildScrollView(
                child: ValueListenableBuilder(
                  valueListenable: trustiesListNotifier,
                  builder: (context, value, child) {
                    final data = value;
                    final trusteeData = value[trusteeIndex!];

                    trusteeId = trusteeData.id;

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
                                              TrusteeDetailsWidget(
                                                  heading: 'Name',
                                                  content: trusteeData.name),
                                              kHeight20,
                                              TrusteeDetailsWidget(
                                                  heading: 'Email',
                                                  content: trusteeData.email),
                                              kHeight20,
                                              TrusteeDetailsWidget(
                                                  heading: 'Address',
                                                  content: trusteeData.address),
                                              kHeight20,
                                              TrusteeDetailsWidget(
                                                  heading: 'Phone',
                                                  content: trusteeData.number),
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
                                                          deleteTrustee(
                                                              trusteeIndex!);

                                                          trusteeDataDeleted =
                                                              true;
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
                                                            return TrusteeUpdateScreen(
                                                              trusteeIndex:
                                                                  trusteeIndex,
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
                        : Text('Trustee Deleted');
                  },
                ),
              )
            : const Center(
                child: Text('Data Deleted'),
              ));
  }
}

class TrusteeDetailsWidget extends StatelessWidget {
  final String heading;
  final String content;
  const TrusteeDetailsWidget(
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
