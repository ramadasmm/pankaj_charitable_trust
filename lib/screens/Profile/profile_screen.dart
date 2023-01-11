import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pankaj_charitable_trust/api/base_client.dart';

import 'package:pankaj_charitable_trust/models/recipients/recipients_model.dart';
import 'package:pankaj_charitable_trust/screens/Students/add_student_screen.dart';
import 'package:pankaj_charitable_trust/widgets/Text%20Form%20Fields/password_widget.dart';
import '../../Widgets/AppBar/app_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Datum>? _foundRecip = [];

  @override
  void initState() {
    _foundRecip = recipientData;

    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Datum>? results = [];

    if (enteredKeyword.isEmpty) {
      results = recipientData;
    } else {
      results = recipientData!
          .where((recip) =>
              recip.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundRecip = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarWidget2(title: 'Recipients')),
      body: FutureBuilder(
          future: BaseClient().getRecipient(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SearchTextFormField(
                              onChanged: (value) => _runFilter(value),
                              hintText: 'Search Trustee',
                              validator: (p0) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, bottom: 10),
                            child: Text(
                              '${_foundRecip!.length} Recipients',
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Flexible(
                              child: ListView.builder(
                            itemCount: _foundRecip!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(_foundRecip![index].name.toString()),
                                subtitle: Text(
                                    _foundRecip![index].college.toString()),
                              );
                            },
                          ))
                        ],
                      )),
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
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
