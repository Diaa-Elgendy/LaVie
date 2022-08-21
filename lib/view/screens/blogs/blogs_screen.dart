import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/blogs/blogs_components.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/blogs_cubit/blogs_cubit.dart';
import 'package:la_vie/view_model/blogs_cubit/blogs_cubit.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: Apply EmptyList in blogs
    //todo: Apply ErrorCard in blogs
    return
      BlocConsumer<BlogsCubit, BlogsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            itemBuilder: (context, index) {
              return const BlogsItem();
            },
            separatorBuilder: (context, index) => Space(),
            itemCount: 4,
          );
        },
      );
  }
}
