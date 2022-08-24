import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.screenPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.noInternetConnection,
            fit: BoxFit.fill,
          ),
          Space(),
          Text(
            'No Internet Connection',
            style: getSemiBoldStyle(fontSize: FontSize.f28),
          ),
          Space(),
          Text(
            'Please check your internet connection and try again.',
            style:
                getRegularStyle(fontSize: FontSize.f20, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
