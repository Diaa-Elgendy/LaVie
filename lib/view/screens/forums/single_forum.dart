import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/forums_items.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/empty_page.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';

class SingleForumScreen extends StatelessWidget {
  String forumTitle;

  SingleForumScreen({required this.forumTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForumsCubit()..getForumByTitle(forumTitle),
      child: BlocBuilder<ForumsCubit, ForumsState>(
        builder: (context, state) {
          ForumsCubit cubit = ForumsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: state is GetForumByTitleSuccess
                ? cubit.forumByTitle!.data!.isNotEmpty? Padding(
                  padding: const EdgeInsets.all(AppPadding.screenPadding),
                  child: Column(
                    children: [
                      ForumItem(forumData: cubit.forumByTitle!.data![0]),
                    ],
                  ),
                ) : EmptyPage(header: 'No Forum Found With This Name.')
                :  Loading(color: ColorManager.primary)
          );
        },
      ),
    );
  }
}
