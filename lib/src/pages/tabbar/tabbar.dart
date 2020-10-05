import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bold_app/src/utilities/constants.dart';
import 'package:bold_app/src/pages/progress/progress.dart';
import 'package:bold_app/src/pages/challenges/challenge.dart';
import 'package:bold_app/src/pages/home/home.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    ChallengePage(),
    ProgressPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.white,
          backgroundColor: greyColor,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: new SvgPicture.asset(
                'assets/images/home.svg',
                width: 25.0,
                color: _currentIndex == 0 ? primaryColor : Colors.white,
              ),
              title: new Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Avenir Regular',
                  fontSize: 10.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new SvgPicture.asset(
                'assets/images/challenges.svg',
                width: 35.0,
                color: _currentIndex == 1 ? primaryColor : Colors.white,
              ),
              title: new Text(
                'Challenges',
                style: TextStyle(
                  fontFamily: 'Avenir Regular',
                  fontSize: 10.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/progress.svg',
                  width: 15.0,
                  color: _currentIndex == 2 ? primaryColor : Colors.white,
                ),
                title: Text(
                  'Progress',
                  style: TextStyle(
                    fontFamily: 'Avenir Regular',
                    fontSize: 10.0,
                  ),
                ))
          ],
        ),
        body: pages[_currentIndex]);
  }
}
