import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(ImageAssets.logo, width: 180),
      nextScreen: const LoginScreen(),
      backgroundColor: ColorManager.offWhite,
      centered: true,
      duration: 2000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(milliseconds: 1500),
      splashIconSize: 170,
    );
  }
}
