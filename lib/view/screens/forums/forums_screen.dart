import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/values_manager.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forums"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppPadding.screenPadding),
        children: [

        ],
      ),
    );
  }
}
