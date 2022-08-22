import 'package:flutter/material.dart';
import 'package:la_vie/model/user/current_user_model.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';

class NotificationItem extends StatelessWidget {
  UserNotification notification;
  NotificationItem({required this.notification ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppPadding.screenPadding,
          right: AppPadding.screenPadding,
          top: 15,
          bottom: 15),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
          width: 32,
          height: 32,
              child: CustomNetworkImage(
                image: '${notification.imageUrl}',
              ),
            ),
          ),
          Space(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${notification.message}',
                  style: getMediumStyle(
                      fontSize: FontSize.f14),
                ),
                Space(height: 5),
                Text('${notification.createdAt!.substring(0,9)} at ${notification.createdAt!.substring(11,16)}',
                    style: getRegularStyle(
                        fontSize: FontSize.f14,
                        color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
