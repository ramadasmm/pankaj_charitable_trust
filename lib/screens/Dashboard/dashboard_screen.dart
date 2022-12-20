import 'package:flutter/material.dart';
import 'package:pankaj_charitable_trust/constants/dimensions.dart';
import 'package:pankaj_charitable_trust/Widgets/AppBar/app_bar_widget.dart';

import 'package:pankaj_charitable_trust/Widgets/Containers/container.dart';
import 'package:pankaj_charitable_trust/Widgets/image_stack_row.dart';

import '../../Widgets/AppBar/app_bar.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget2(
            title: 'Dashboard',
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight10,
            ContainerWidget(
              // height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'Task Overview',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Divider(thickness: 1, height: 25),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '45.22%',
                              style: TextStyle(
                                  color: Color(0xFF702de3),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Icon(
                                    Icons.arrow_drop_up,
                                    size: 30,
                                    color: Color(0xFF00d55a),
                                  ),
                                  Text(
                                    '14%',
                                    style: TextStyle(
                                        color: Color(0xFF00d55a),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowWidget(),
                        Divider(
                          thickness: 1,
                        ),
                        RowWidget(),
                        Divider(
                          thickness: 1,
                        ),
                        RowWidget(),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ContainerWidget(
              // height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'Pending Projects',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Divider(thickness: 1, height: 25),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Branding Design',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        kHeight10,
                        Row(
                          children: const [
                            Icon(
                              Icons.access_time_outlined,
                              color: Color(0xFF71809c),
                            ),
                            kWidth10,
                            Text(
                              '11 : 00  AM',
                              style: TextStyle(
                                color: Color(0xFF606c83),
                              ),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Color(0xFF71809c),
                            ),
                            kWidth10,
                            Text(
                              'August 24, 2020',
                              style: TextStyle(
                                color: Color(0xFF606c83),
                              ),
                            )
                          ],
                        ),
                        kHeight30,
                        const Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        kHeight10,
                        const Text(
                          'Please, the logo must represent the brand character, positioning, and the client USP and ESP.',
                          style: TextStyle(
                              color: Color(0xFF4f5b74),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        kHeight20,
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Color(0xFFfff5ca),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Meeting',
                                    style: TextStyle(color: Color(0xFFffd423)),
                                  ),
                                  Icon(
                                    Icons.cancel_rounded,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Color(0xFFd9f8fc),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Project',
                                    style: TextStyle(color: Color(0xFF05c3eb)),
                                  ),
                                  Icon(
                                    Icons.cancel_rounded,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        kHeight30,
                        ImageStackRow(image: 'assets/images/image.png'),
                        kHeight10,
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Team Members',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFc0c7d4)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 80,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(4, 2))
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/recipient.png')),
                      ),
                      const Text('Recipients')
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(4, 2))
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/college.png')),
                      ),
                      const Text('Colleges')
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(4, 2))
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/gallery.png')),
                      ),
                      const Text('Gallery')
                    ],
                  ),
                ),
              ],
            ),
            kHeight20,
            ContainerWidget(
              // height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Scholarship Awarded',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {}, child: Text('view all'))
                          ],
                        ),
                        Text(
                          '48 Students',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trustees',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {}, child: Text('view all'))
                          ],
                        ),
                        Text(
                          '10 Trustees',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Colleges',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {}, child: Text('view all'))
                          ],
                        ),
                        Text(
                          '10 Colleges',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Website Project",
          style: TextStyle(fontSize: 14, color: Color(0xFF72809d)),
        ),
        Container(
          width: 145,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                '24%',
                style: TextStyle(fontSize: 14, color: Color(0xFF72809d)),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Color(0xFFff0000),
              ),
              Text(
                '24%',
                style: TextStyle(fontSize: 14, color: Color(0xFFff0000)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
