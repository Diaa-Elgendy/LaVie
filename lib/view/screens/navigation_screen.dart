import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/view/screens/blogs/blogs_screen.dart';
import 'package:la_vie/view/screens/blogs_forums/blogs_forums_screen.dart';
import 'package:la_vie/view/screens/notification_screen.dart';
import 'package:la_vie/view/screens/profile/profile_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import 'home/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    BlogsForumsScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: screens[currentTab],
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(AssetsManager.scanIcon, width: 25, height: 25,),
        onPressed: () {},
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: const EdgeInsets.only(left: 20),
              onPressed: () {
                setState(() {
                  currentTab = 0;
                });
              },
              icon: Image.asset(AssetsManager.leafIcon, height: 27,),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 1;
                });
              },
              icon: Image.asset(AssetsManager.homeIcon, height: 22,),
            ),
            Space(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 2;
                });
              },
              icon: Image.asset(AssetsManager.bellIcon, height: 23,),
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 20),

              onPressed: () {
                setState(() {
                  currentTab = 3;
                });
              },
              icon: Image.asset(AssetsManager.personIcon, height: 22,),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Scaffold(
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
    )
 */