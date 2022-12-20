import 'package:flutter/material.dart';

class ImageStackRow extends StatelessWidget {
  final String image;
  const ImageStackRow({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(45),
              color: Colors.blue,
            ),
            child: const Center(
              child: Text(
                '+2',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 55),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 75),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
