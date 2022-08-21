import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/cart/cart_screen.dart';
import 'package:la_vie/view/screens/forums/forums_components.dart';
import 'package:la_vie/view/screens/forums/single_forum.dart';
import 'package:la_vie/view/widgets/components.dart';
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

  List<bool> chipsSelected = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        return state is GetForumsSuccess
            ? cubit.forumsModel.data!.isNotEmpty
                ? Padding(
                  padding: const EdgeInsets.all(AppPadding.screenPadding),
                  child: Column(
                      children: [
                        //Search container
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.greyLight,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.borderRadius),
                                ),
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
                                  style: getRegularStyle(fontSize: FontSize.f16),
                                  cursorColor: ColorManager.primary,
                                ),
                              ),
                            ),
                            Space(),
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(
                                      AppSize.borderRadius)),
                              child: IconButton(
                                onPressed: () {
                                  cubit.forumByTitle = null;
                                  navigateTo(context: context, widget: SingleForumScreen(forumTitle: searchCtrl.text));
                                },
                                icon: const Icon(Icons.search,
                                  color: ColorManager.white,
                                ),
                              ),
                            ),

                          ],
                        ),
                        Space(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChoiceChip(
                              label: Text(
                                "All Forums",
                                style: getMediumStyle(
                                    color: chipsSelected[0]
                                        ? ColorManager.primary
                                        : ColorManager.grey),
                              ),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.all(8),
                              selected: chipsSelected[0],
                              selectedColor: ColorManager.white,
                              backgroundColor: ColorManager.greyLight,
                              shape: chipsSelected[0]
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
                                  chipsSelected[0] = true;
                                  chipsSelected[1] = false;
                                });
                              },
                            ),
                            Space(),
                            ChoiceChip(
                              label: Text(
                                "My Forums",
                                style: getMediumStyle(
                                    color: chipsSelected[1]
                                        ? ColorManager.primary
                                        : ColorManager.grey),
                              ),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.all(8),
                              selected: chipsSelected[1],
                              selectedColor: ColorManager.white,
                              backgroundColor: ColorManager.greyLight,
                              shape: chipsSelected[1]
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
                                  chipsSelected[1] = true;
                                  chipsSelected[0] = false;
                                });
                              },
                            ),
                          ],
                        ),
                        Space(),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ForumItem(forumData: cubit.forumsModel.data![index]),
                          separatorBuilder: (context, index) => Space(),
                          itemCount: cubit.forumsModel.data!.length,
                        ),
                      ],
                    ),
                )
                : EmptyPage(header: 'No Available Forms Right Now.')
            : state is GetForumsLoading
                ? Loading(color: ColorManager.primary)
                : ErrorCard(
                    function: () {
                      cubit.getMyForums();
                    },
                    title: 'Error Occur While Getting Data.',
                  );
      },
    );
  }
}
