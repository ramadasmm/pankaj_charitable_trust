import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/screens/Trustees/add_trustee_screen.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';

import 'package:pankaj_charitable_trust/screens/Trustees/trustee_details_screen.dart';

import '../../Widgets/Text Form Fields/password_widget.dart';
import '../../database/models/trusties_model.dart';

int? trusteeIndex;
TrsutiesModel? trustee;

class TrusteesListScreen extends StatelessWidget {
  const TrusteesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllTrusties();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget2(title: 'Trustees')),
      body: ValueListenableBuilder(
        valueListenable: trustiesListNotifier,
        builder: (context, value, child) {
          final data = value;

          return Stack(
            children: [
              Container(
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
                          'Trustee Details',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, bottom: 10),
                        child: Text(
                          '${data.length} Trusties',
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
                          hintText: 'Search Trustee',
                          controller: TextEditingController(),
                          validator: (p0) {},
                        ),
                      ),
                      Flexible(
                          child: data.isNotEmpty
                              ? ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    trustee = value[index];
                                    return ListTile(
                                      title: Text(trustee!.name),
                                      subtitle: Text(trustee!.address),
                                      trailing: Text(
                                        trustee!.number,
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      onTap: () {
                                        trusteeIndex = index;
                                        if (trustee!.name.isNotEmpty) {
                                          getTrustee(trusteeIndex!);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return TrusteeDetailsScreen();
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 5,
                                      thickness: 1,
                                    );
                                  },
                                  itemCount: data.length)
                              : const Center(
                                  child: Text("No Trustees"),
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
                          return AddTrusteeScreen();
                        },
                      ));
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
