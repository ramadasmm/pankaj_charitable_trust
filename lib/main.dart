import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pankaj_charitable_trust/database/models/gallery_model.dart';
import 'package:pankaj_charitable_trust/database/models/student_model.dart';
import 'package:pankaj_charitable_trust/database/models/trusties_model.dart';
import 'package:pankaj_charitable_trust/screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(TrsutiesModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(GalleryModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
    Hive.registerAdapter(TrsutiesModelAdapter());
    Hive.registerAdapter(GalleryModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey[800],
          backgroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 1,
            titleSpacing: 20),
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
