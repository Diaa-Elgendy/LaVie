import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';

import 'components.dart';

class EmptyPage extends StatelessWidget {
  String header;
  String? body;

  EmptyPage({required this.header, this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Image.asset(
                AssetsManager.clipboard,
              ),
            ),
            Space(height: 40),
            Text(
              header,
              style: getSemiBoldStyle(fontSize: FontSize.f24),
            ),
            Space(),
            Text(
              body??'',
              style:
              getMediumStyle(fontSize: FontSize.f18, color: ColorManager.grey),
            ),
          ],
        ),
      ),
    );
  }
}
