import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/dio_network/end_points.dart';

class SingleBlogScreen extends StatelessWidget {
  const SingleBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Image.asset(AssetsManager.singleBlog, height: 300, fit: BoxFit.fill,),
          // SizedBox(
          //   height: 350,
          //   child: CustomNetworkImage(
          //     image: "/uploads/42edbb62-b102-451b-aa6a-2171ffbf7c62.jpg",
          //     radius: 0,
          //   ),
          // ),
          Space(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('5 Simple Tips to treat plants', style: getMediumStyle(fontSize: FontSize.f24),),
                Space(),
                Text('leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  ', style: getRegularStyle(fontSize: FontSize.f20, color: ColorManager.grey),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
