import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/database/models/gallery_model.dart';
import 'package:pankaj_charitable_trust/widgets/Buttons/app_button.dart';
import 'package:pankaj_charitable_trust/widgets/Containers/container.dart';
import 'package:pankaj_charitable_trust/widgets/Text%20Form%20Fields/text_form_widget.dart';

import '../../Widgets/AppBar/app_bar_widget.dart';
import '../../Widgets/Text Form Fields/address_text_widget.dart';

final ImagePicker imagePicker = ImagePicker();
List<Uint8List> imageFileList = [];
void selectImage() async {
  final List<Uint8List>? selectedImages =
      (await imagePicker.pickMultiImage()).cast<Uint8List>();
  if (selectedImages!.isNotEmpty) {
    imageFileList.addAll(selectedImages);
  }
}

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  DateTime? _dateNow;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget2(
          title: 'Upload Images',
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: ContainerWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'Upload Image',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Divider(thickness: 1, height: 25),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DottedBorder(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    selectImage();
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.deepPurple,
                                  )),
                              kHeight10,
                              const Text(
                                'Drop your Image or Browse Here',
                              )
                            ],
                          ),
                        ),
                      ),
                      kHeight40,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Event :',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      TextFormWidget(
                          hintText: 'Enter Event',
                          controller: eventNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Event';
                            }
                          }),
                      kHeight20,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Description:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      AddressTextField(
                        hintText: 'Event Description',
                        controller: descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Details';
                          } else if (!RegExp(r'(^[#.0-9a-zA-Z\s,-]+$)')
                              .hasMatch(value)) {
                            return 'Enter correct address';
                          }
                        },
                      ),
                      kHeight20,
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Date:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      kHeight10,
                      FormField<bool>(
                        builder: (state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  final _dateNowTemp = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime.now());

                                  if (_dateNowTemp == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      _dateNow = _dateNowTemp;
                                    });
                                  }
                                },
                                child: _dateNow == null
                                    ? Container(
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text("Event Date")),
                                      )
                                    : Container(
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                                "${_dateNow!.day}-${_dateNow!.month}-${_dateNow!.year}")),
                                      ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 9.0),
                                child: Text(
                                  state.errorText ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        validator: (value) {
                          if (_dateNow == null) {
                            return 'Select Date';
                          }
                        },
                      ),
                      kHeight10,
                      Center(
                          child: InkWell(
                              onTap: () {
                                final eventName = eventNameController.text;
                                final description = descriptionController.text;
                                final date = _dateNow!.year.toString();

                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  final gallery = GalleryModel(
                                      images: imageFileList,
                                      eventName: eventName,
                                      description: description,
                                      dateTime: date);

                                  saveImage(gallery);
                                  Navigator.pop(context);
                                }
                              },
                              child: AppButton(text: 'Upload Image'))),
                      kHeight20,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
