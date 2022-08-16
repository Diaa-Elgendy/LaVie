import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/screens/home_screen.dart';
import 'package:la_vie/presenation/screens/notification_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const NotificationScreen(),
    const NotificationScreen(),
    const NotificationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: ColorManager.primary,

        key: _bottomNavigationKey,
        height: 55,
        items: [
          Tab(icon: Image.asset(AssetsManager.leafIcon),height: 30),
          Tab(icon: Image.asset(AssetsManager.scanIcon),height: 25),
          Tab(icon: Image.asset(AssetsManager.homeIcon),height: 28),
          Tab(icon: Image.asset(AssetsManager.bellIcon),height: 28),
          Tab(icon: Image.asset(AssetsManager.personIcon),height: 26),
        ],
        index: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
