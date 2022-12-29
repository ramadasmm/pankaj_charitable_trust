import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pankaj_charitable_trust/database/functions/db_helper.dart';
import 'package:pankaj_charitable_trust/screens/Gallery/image_list_screen.dart';
import 'package:pankaj_charitable_trust/screens/Gallery/image_upload_screen.dart';
import 'package:pankaj_charitable_trust/widgets/Containers/container.dart';

import '../../Widgets/AppBar/app_bar_widget.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget2(
          title: 'Gallery',
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: galleryListNotifier,
        builder: (context, value, child) {
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
                child: GridView.builder(
                  itemCount: value.length,
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final eventImage = value[index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ImageListScreen();
                          },
                        ));
                      },
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                              ),
                              height: 130,
                              width: 180,
                              child: Image.memory(
                                eventImage.images.first,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(eventImage.eventName),

                          Text(
                            eventImage.dateTime,
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500),
                          ),
                          // Text(index.toString()),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ImageUploadScreen();
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
