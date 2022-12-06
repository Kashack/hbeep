import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbeep/main_screen/bmi_page.dart';
import 'package:hbeep/main_screen/home_page.dart';
import 'package:hbeep/main_screen/prediction_page.dart';

import 'main_screen/user_page.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: bottomNavigationPages[_selectindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectindex,
        elevation: 3,
        onTap: (value) => setState(() {
          _selectindex = value;
        }),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/active_home_icon.svg',
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/heart_icon.svg'),
              activeIcon: SvgPicture.asset('assets/icons/active_heart_icon.svg'),
              label: 'Predicition'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/bmi_icon.svg'),
              activeIcon: SvgPicture.asset('assets/icons/active_bmi_icon.svg'),
              label: 'BMI'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user_icon.svg',
                height: 24,
                width: 24,
              ),
              label: 'Doctor'),
        ],
      ),
    );
  }
}
List bottomNavigationPages = [
  HomePage(),
  PredictionPage(),
  BMIPage(),
  UserPage(),
];
