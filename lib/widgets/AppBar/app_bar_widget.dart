import 'package:flutter/material.dart';

class AppBarWidget2 extends StatelessWidget {
  final String title;
  AppBarWidget2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      toolbarHeight: 80,
      title: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.deepPurple, fontSize: 16),
        ),
      ),
      leading: Container(
        width: 19,
        height: 19,
        margin: const EdgeInsets.all(15),
        child: const Image(
          image: AssetImage('assets/images/search.png'),
        ),
      ),
      actions: <Widget>[
        Container(
          height: 22,
          width: 22,
          margin: const EdgeInsets.only(right: 15),
          child:
              const Image(image: AssetImage('assets/images/notification.png')),
        ),
        Container(
          height: 22,
          width: 22,
          margin: const EdgeInsets.only(right: 15),
          child: const Image(image: AssetImage('assets/images/appbaricon.png')),
        )
      ],
    );
  }
}
