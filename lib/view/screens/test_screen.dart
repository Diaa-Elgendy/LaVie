import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/screens/home/home_screen.dart';
import 'package:la_vie/view/screens/notification_screen.dart';
import 'package:la_vie/view/screens/profile/profile_screen.dart';
import 'package:la_vie/view/widgets/components.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    NotificationScreen(),
    NotificationScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentScreen = ProfileScreen();
                  currentTab = 0;
                });
              },
              icon: Icon(
                Icons.home,
                color: currentTab == 0
                    ? ColorManager.primary
                    : ColorManager.textColor,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentScreen = NotificationScreen();
                  currentTab = 1;
                });
              },
              icon: Icon(
                Icons.home,
                color: currentTab == 1
                    ? ColorManager.primary
                    : ColorManager.textColor,
              ),
            ),
            Space(),
            IconButton(
              onPressed: () {
                setState(() {
                  currentScreen = NotificationScreen();
                  currentTab = 2;
                });
              },
              icon: Icon(
                Icons.home,
                color: currentTab == 2
                    ? ColorManager.primary
                    : ColorManager.textColor,
              ),
            ),
            IconButton(
              splashColor: Colors.white,
              onPressed: () {
                setState(() {
                  currentScreen = NotificationScreen();
                  currentTab = 3;
                });
              },
              icon: Icon(
                Icons.home,
                color: currentTab == 3
                    ? ColorManager.primary
                    : ColorManager.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
