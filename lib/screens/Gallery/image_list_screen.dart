import 'dart:io';

import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/screens/Gallery/image_upload_screen.dart';
import 'package:pankaj_charitable_trust/widgets/Containers/container.dart';

import '../../Widgets/AppBar/app_bar_widget.dart';

class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget2(
          title: 'Images',
        ),
      ),
      body: ContainerWidget(
        child: GridView.builder(
          itemCount: imageFileList.length,
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.6),
              ),
              // child: Image.file(
              //   File(imageFileList[index]),
              //   fit: BoxFit.cover,
              //   height: 200,
              //   width: 180,
              // ),
            );
          },
        ),
      ),
    );
  }
}
