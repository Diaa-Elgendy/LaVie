import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/style_manager.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
      ),
      body: Center(
        child: Text("Blogs Screen", style: getSemiBoldStyle(fontSize: 30),),
      ),
    );
  }
}
