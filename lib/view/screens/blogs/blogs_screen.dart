import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/blogs/blogs_components.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/empty_page.dart';
import 'package:la_vie/view_model/blogs_cubit/blogs_cubit.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogsCubit, BlogsState>(
      listener: (context, state) {},
      builder: (context, state) {
        BlogsCubit cubit = BlogsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Blogs'),
          ),
          body: state is GetBlogsSuccess
              ? cubit.blogsModel!.data!.plants!.isNotEmpty
              ? ListView.separated(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            itemBuilder: (context, index) {
              return BlogsItem(
                blogsPlants: cubit.blogsModel!.data!.plants![index],
              );
            },
            separatorBuilder: (context, index) => Space(),
            itemCount: cubit.blogsModel!.data!.plants!.length,
          )
              : EmptyPage(header: 'No Blogs Available Right Now')
              : state is GetBlogsLoading
              ? Loading(color: ColorManager.primary)
              : ErrorCard(
            function: () {
              cubit.getBlogs();
            },
          ),
        );
      },
    );
  }
}
