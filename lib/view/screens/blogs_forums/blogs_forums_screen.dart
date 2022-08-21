import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/blogs/blogs_screen.dart';
import 'package:la_vie/view/screens/forums/create_new_post.dart';
import 'package:la_vie/view/screens/forums/forums_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/blogs_cubit/blogs_cubit.dart';

import '../blogs/blogs_components.dart';

class BlogsForumsScreen extends StatefulWidget {
  BlogsForumsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsForumsScreen> createState() => _BlogsForumsScreenState();
}

class _BlogsForumsScreenState extends State<BlogsForumsScreen> {

  bool firstChoice = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          //Choices
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: Text(
                  "Blogs",
                  style: getMediumStyle(
                      color: firstChoice
                          ? ColorManager.primary
                          : ColorManager.grey),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(8),
                selected: firstChoice,
                selectedColor: ColorManager.white,
                backgroundColor: ColorManager.greyLight,
                shape: firstChoice
                    ? RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppSize.borderRadius),
                  side: const BorderSide(
                      width: 1.5, color: ColorManager.primary),
                )
                    : RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppSize.borderRadius),
                  side: const BorderSide(
                      width: 1.5, color: ColorManager.greyLight),
                ),
                onSelected: (value) {
                  setState(() {
                    firstChoice = true;
                  });
                },
              ),
              Space(),
              ChoiceChip(
                label: Text(
                  "Forums",
                  style: getMediumStyle(
                      color: !firstChoice
                          ? ColorManager.primary
                          : ColorManager.grey),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(8),
                selected: !firstChoice,
                selectedColor: ColorManager.white,
                backgroundColor: ColorManager.greyLight,
                shape: !firstChoice
                    ? RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppSize.borderRadius),
                  side: const BorderSide(
                      width: 1.5, color: ColorManager.primary),
                )
                    : RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppSize.borderRadius),
                  side: const BorderSide(
                      width: 1.5, color: ColorManager.greyLight),
                ),
                onSelected: (value) {
                  setState(() {
                    firstChoice = false;
                  });
                },
              ),
            ],
          ),

          if(firstChoice)
            const BlogsScreen(),
          if(!firstChoice)
            ForumsScreen()

        ],
      ),
      floatingActionButton: !firstChoice ? FloatingActionButton(
        onPressed: () =>
            navigateTo(context: context, widget: CreateNewPost()),
        child: const Icon(
          Icons.add,
          color: ColorManager.white,
        ),
      ) : null,
    );
  }
}
