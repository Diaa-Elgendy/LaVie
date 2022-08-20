import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/blogs/blogs_components.dart';
import 'package:la_vie/view/widgets/components.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      //todo: Apply EmptyList in blogs
      //todo: Apply ErrorCard in blogs
      body: ListView.separated(
        padding: const EdgeInsets.all(AppPadding.screenPadding),
        itemBuilder: (context, index) {
          return const BlogsItem();
        },
        separatorBuilder: (context, index) => Space(),
        itemCount: 4,
      ),
    );
  }
}
