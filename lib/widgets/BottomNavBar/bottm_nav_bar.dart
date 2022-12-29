import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, newIndex, child) {
        return BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          elevation: 50,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          iconSize: 30,
          currentIndex: newIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.image_search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: ""),
          ],
        );
      },
    );
  }
}
