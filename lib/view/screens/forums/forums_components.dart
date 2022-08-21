import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/model/forums/my_forums_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/components.dart';

class ForumItem extends StatelessWidget {
  ForumData forumData;
  ForumItem({required this.forumData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          //forum header
          Padding(
            padding: const EdgeInsets.all(AppPadding.cardPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                    child: Image.asset(AssetsManager.user1),
                  ),
                ),
                Space(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space(height: 4),
                    Text('Mayar Mohamed', style: getSemiBoldStyle(fontSize: FontSize.f16, color: ColorManager.black), maxLines: 1,),
                    Space(height: 5),
                    Text('A month ago', style: getRegularStyle(fontSize: FontSize.f14, color: ColorManager.grey),maxLines: 1,),
                  ],
                ),
              ],
            ),
          ),
          Space(height: 5),

          //forum image
          FractionallySizedBox(
            widthFactor: 1,
            child: SizedBox(
              height: 150,
              child: CustomNetworkImage(image: forumData.imageUrl ?? '', radius: 0),
            ),
          ),
          Space(height: 5),

          //likes and comments
          Padding(
            padding: const EdgeInsets.all(AppPadding.cardPadding),
            child: Row(
              children: [
                Image.asset(AssetsManager.likeIcon, width: 20, height: 20,),
                Text('  2  Likes', style: getMediumStyle(fontSize: FontSize.f16),),
                Space(),
                Text('  2  Replies', style: getMediumStyle(fontSize: FontSize.f16),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
