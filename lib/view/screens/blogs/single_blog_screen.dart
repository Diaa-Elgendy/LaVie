import 'package:flutter/material.dart';
import 'package:la_vie/model/blogs/blogs_model.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/dio_network/end_points.dart';

class SingleBlogScreen extends StatelessWidget {
  BlogsPlants blogsPlants;

  SingleBlogScreen({required this.blogsPlants, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: CustomNetworkImage(
              image: blogsPlants.imageUrl!,
              radius: 0,
            ),
          ),
          Space(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${blogsPlants.name}',
                  style: getMediumStyle(fontSize: FontSize.f24),
                ),
                Space(),
                Text(
                  '${blogsPlants.description}',
                  style: getRegularStyle(
                      fontSize: FontSize.f20, color: ColorManager.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
