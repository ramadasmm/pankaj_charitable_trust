import 'package:flutter/material.dart';

import '../../Widgets/AppBar/app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget2(title: 'Profile')),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
