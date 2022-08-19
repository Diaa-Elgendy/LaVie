import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';

import '../resources/style_manager.dart';
import '../widgets/components.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: ListView(
        children: [
          Space(height: 30),
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.screenPadding,
                right: AppPadding.screenPadding,
                top: 15,
                bottom: 15),
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.user1,
                  width: 32,
                  height: 32,
                ),
                Space(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joy Arnold left 6 comments on Your Post',
                        style: getMediumStyle(fontSize: FontSize.f14),
                      ),
                      Space(height: 5),
                      Text('Yesterday at 11:42 PM',
                          style: getRegularStyle(
                              fontSize: FontSize.f14, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorManager.grey,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.screenPadding,
                right: AppPadding.screenPadding,
                top: 15,
                bottom: 15),
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.user1,
                  width: 32,
                  height: 32,
                ),
                Space(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joy Arnold left 6 comments on Your Post',
                        style: getMediumStyle(fontSize: FontSize.f14),
                      ),
                      Space(height: 5),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            const VerticalDivider(
                              thickness: 2,
                              color: ColorManager.borderColor,
                            ),
                            Expanded(
                              child: Text(
                                '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
                                style: getMediumStyle(fontSize: FontSize.f14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Space(height: 5),
                      Text('Yesterday at 11:42 PM',
                          style: getRegularStyle(
                              fontSize: FontSize.f14, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
