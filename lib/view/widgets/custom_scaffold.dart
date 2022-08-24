import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/no_internet_screen.dart';

class CustomNetworkChecker extends StatelessWidget {
  Widget child;

  CustomNetworkChecker({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return child;
        }
        else{
          return const NoInternetScreen();
        }
      },
      child: child,
    );
  }
}
