import 'package:flutter/material.dart';
import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/address_text_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/number_text_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Text%20Form%20Fields/text_form_widget.dart';
import 'package:pankaj_charitable_trust/Widgets/Buttons/app_button.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/database/models/trusties_model.dart';

class AddTrusteeScreen extends StatelessWidget {
  AddTrusteeScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Trustees'),
          titleSpacing: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //height: 600,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
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
                          hintText: 'Enter Name',
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Name';
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
                        hintText: 'Enter Email',
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
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
                              return 'Please Enter Number';
                            } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
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
                          }),
                      kHeight30,
                      Center(
                          child: InkWell(
                              onTap: () {
                                final name = nameController.text;
                                final email = emailController.text;
                                final number = numberController.text;
                                final address = addressController.text;

                                final _tustie = TrsutiesModel(
                                    name: name,
                                    email: email,
                                    number: number,
                                    address: address);

                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  addTrusties(_tustie);

                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      margin: EdgeInsets.all(10),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('User already exist'),
                                    ),
                                  );
                                }
                              },
                              child: AppButton(text: 'Save')))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
