import 'package:flutter/material.dart';

import 'package:pankaj_charitable_trust/screens/Dashboard/dashboard_screen.dart';
import 'package:pankaj_charitable_trust/screens/Gallery/gallery_screen.dart';
import 'package:pankaj_charitable_trust/screens/Profile/profile_screen.dart';
import 'package:pankaj_charitable_trust/screens/Students/add_student_screen.dart';
import 'package:pankaj_charitable_trust/screens/Students/students_list_screen.dart';
import 'package:pankaj_charitable_trust/screens/Trustees/add_trustee_screen.dart';
import 'package:pankaj_charitable_trust/screens/Trustees/trustees_list_screen.dart';
import 'package:pankaj_charitable_trust/Widgets/BottomNavBar/bottm_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    DashBoardScreen(),
    TrusteesListScreen(),
    StudentListScreen(),
    GalleryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, index, child) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
