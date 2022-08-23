import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

class ValuesCardForPlant extends StatelessWidget {
  String label, superScript, image;
  int value;

  ValuesCardForPlant(
      {super.key,
      required this.label,
      required this.superScript,
      required this.image,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.cardPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          color: ColorManager.primaryLight2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: value.toString(),
                        style: getSemiBoldStyle(fontSize: 20),

                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(-4, -20),
                          child: Text(
                            superScript,
                            style: getRegularStyle(fontSize: FontSize.f14),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  image,
                  width: 20,
                  height: 20,
                )
              ],
            ),
            Space(height: 5),
            Text(
              label,
              style: getRegularStyle(fontSize: FontSize.f18),
            ),
          ],
        ),
      ),
    );
  }
}
