import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final double fontSize;
  AppBarWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.fontSize = 28})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                TextStyle(color: Colors.deepPurpleAccent, fontSize: fontSize),
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
      elevation: 0,
      actions: const [
        Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.notifications_outlined,
          color: Colors.black,
          size: 30,
        ),
        kWidth10
      ],
    );
  }
}
