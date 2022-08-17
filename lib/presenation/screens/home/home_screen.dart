import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/routes_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';
import 'package:la_vie/presenation/screens/exam_screen.dart';
import 'package:la_vie/presenation/screens/home/cubit/home_cubit.dart';
import 'package:la_vie/presenation/screens/home/home_components.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:la_vie/presenation/widgets/custom_button.dart';
import 'package:la_vie/presenation/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selected = false;
  TextEditingController searchCtrl = TextEditingController();

  List<String> chipsTitle = [
    'All',
    'Plants',
    'Seeds',
    'Tools',
  ];
  List<bool> chipsSelected = [
    true,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);

        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(AppPadding.screenPadding),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.logo,
                      height: 50,
                    ),
                    Positioned(
                      right: 0,
                      child: Card(
                        shape: const CircleBorder(),
                        elevation: AppSize.elevation,
                        color: ColorManager.greyLight,
                        child: IconButton(
                          onPressed: () {
                            navigateTo(context: context, widget: ExamScreen());
                          },
                          icon: const Icon(Icons.question_mark),
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ),
                  ],
                ),
                Space(height: 30),

                //Search bar with cart
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.greyLight,
                            borderRadius:
                                BorderRadius.circular(AppSize.borderRadius)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: ColorManager.grey,
                            ),
                            isDense: true,
                            hintText: 'Search...',
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
                          borderRadius:
                              BorderRadius.circular(AppSize.borderRadius)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const ImageIcon(
                            AssetImage(AssetsManager.cartIcon),
                            color: ColorManager.white),
                      ),
                    )
                  ],
                ),
                Space(height: 30),

                //Choice chip
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ChoiceChip(
                        label: Text(
                          chipsTitle[index],
                          style: getMediumStyle(
                              color: chipsSelected[index]
                                  ? ColorManager.primary
                                  : ColorManager.grey),
                        ),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(8),
                        selected: chipsSelected[index],
                        selectedColor: ColorManager.white,
                        backgroundColor: ColorManager.greyLight,
                        shape: chipsSelected[index]
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
                            chipsSelected[index] = value;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Space(),
                    itemCount: chipsTitle.length,
                  ),
                ),
                Space(height: 30),

                //Gridview
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 50),
                    itemCount: 5,
                    itemBuilder: (BuildContext ctx, index) {
                      return PlantCard(plant: cubit.plantModel!.data![index],);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
