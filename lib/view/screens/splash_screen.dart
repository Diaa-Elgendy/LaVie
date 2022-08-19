import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view_model/shared_pref/cache_manager.dart';

import '../../view_model/app/functions.dart';
import '../../view_model/shared_pref/cache_helper.dart';
import '../resources/color_manager.dart';
import 'authorize/authorize_screen.dart';
import 'navigation_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StringManager.userToken = CacheHelper.getData(CacheManager.accessToken)  ?? '';
    show('loooooo:   ${StringManager.userToken}');

    return AnimatedSplashScreen(
      splash: Image.asset(AssetsManager.logo, width: 180),
      nextScreen: StringManager.userToken.isEmpty ? const AuthorizeScreen() : const NavigationScreen(),
      backgroundColor: ColorManager.offWhite,
      centered: true,
      duration: 2000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(milliseconds: 1500),
      splashIconSize: 170,
    );
  }
}
