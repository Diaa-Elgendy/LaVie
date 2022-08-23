import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/cart/cart_screen.dart';
import 'package:la_vie/view/screens/forums/create_new_post_screen.dart';
import 'package:la_vie/view/widgets/forums_items.dart';
import 'package:la_vie/view/screens/forums/single_forum.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/custom_choice_chip.dart';
import 'package:la_vie/view/widgets/empty_page.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';
import '../../resources/font_manager.dart';

class ForumsScreen extends StatefulWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  State<ForumsScreen> createState() => _ForumsScreenState();
}

class _ForumsScreenState extends State<ForumsScreen> {
  TextEditingController searchCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isAllForums = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('Forums'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(AppPadding.screenPadding),
              children: [
                //Search container
                Form(
                  key: formKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: ColorManager.grey,
                            ),
                            isDense: true,
                            hintText: 'Search... (eg: test)',
                            hintStyle:
                                getRegularStyle(color: ColorManager.grey),
                            contentPadding: const EdgeInsets.all(8),
                            fillColor: Colors.red,
                          ),
                          controller: searchCtrl,
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ' must not be empty';
                            }
                            return null;
                          },
                          style: getRegularStyle(fontSize: FontSize.f16),
                          cursorColor: ColorManager.primary,
                        ),
                      ),
                      Space(),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius:
                                BorderRadius.circular(AppSize.borderRadius)),
                        child: IconButton(
                          onPressed: () {
                            cubit.forumByTitle = null;
                            if (formKey.currentState!.validate()) {
                              navigateTo(
                                  context: context,
                                  widget: SingleForumScreen(
                                      forumTitle: searchCtrl.text));
                            }

                          },
                          icon: const Icon(
                            Icons.search,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Space(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomChoiceChip(
                      text: 'All Forums',
                      isSelected: isAllForums,
                      onSelected: () {
                        setState(() {
                          isAllForums = true;
                          cubit.getAllForums();
                        });
                      },
                    ),
                    Space(),
                    CustomChoiceChip(
                      text: 'My Forums',
                      isSelected: !isAllForums,
                      onSelected: () {
                        setState(() {
                          isAllForums = false;
                          cubit.getMyForums();
                        });
                      },
                    ),
                  ],
                ),
                Space(),

                Center(
                  child: (state is GetAllForumsSuccess ||
                          state is GetMyForumsSuccess)
                      ? cubit.forumsModel.data!.isNotEmpty
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ForumItem(
                                  forumData: cubit.forumsModel.data![index]),
                              separatorBuilder: (context, index) => Space(),
                              itemCount: cubit.forumsModel.data!.length,
                            )
                          : EmptyPage(header: 'No Available Forms Right Now.')
                      : (state is GetAllForumsLoading ||
                              state is GetMyForumsLoading)
                          ? Loading(color: ColorManager.primary)
                          : ErrorCard(
                              function: () {
                                cubit.getMyForums();
                              },
                              title: 'Error Occur While Getting Data.',
                            ),
                ),
              ],
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigateTo(context: context, widget: CreateNewPostScreen()),
          child: const Icon(Icons.add),
        ),);
      },
    );
  }
}
