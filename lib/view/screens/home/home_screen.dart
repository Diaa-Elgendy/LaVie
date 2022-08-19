import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/home/product_model.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/home/home_components.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:la_vie/view_model/home_cubit/home_cubit.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/string_manager.dart';
import '../exam/exam_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<bool> chipsSelected = [
  true,
  false,
  false,
  false,
];

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();

  List<String> chipsTitle = [
    'All',
    'Plants',
    'Seeds',
    'Tools',
  ];

List<Product> filteredList = [];
  String filter = 'ALL';
  int filterLength = 0;
  @override
  Widget build(BuildContext context) {
    show('User Token:: ${StringManager.userToken}');
    return BlocProvider(
  create: (context) => HomeCubit()..getProducts(),
  child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is GetProductsSuccess){
          filterLength = state.productsModel.products!.length;
          filteredList.addAll(state.productsModel.products!);
        }
      },
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        print(filterLength);

        return Scaffold(
          body: state is GetProductsSuccess
              ? SafeArea(
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
                                  navigateTo(
                                      context: context,
                                      widget: const ExamScreen());
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
                                  borderRadius: BorderRadius.circular(
                                      AppSize.borderRadius)),
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
                                borderRadius: BorderRadius.circular(
                                    AppSize.borderRadius)),
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
                                      borderRadius: BorderRadius.circular(
                                          AppSize.borderRadius),
                                      side: const BorderSide(
                                          width: 1.5,
                                          color: ColorManager.primary),
                                    )
                                  : RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSize.borderRadius),
                                      side: const BorderSide(
                                          width: 1.5,
                                          color: ColorManager.greyLight),
                                    ),
                              onSelected: (value) {
                                  setState(() {

                                      filteredList.clear();
                                    if (index == 0 && value == true) {
                                      chipsSelected = [true, false, false, false];
                                      filterLength = 0;

                                      filter = 'ALL';
                                      filteredList.addAll(cubit.productsModel!.products!);

                                      filterLength = cubit.productsModel!.products!.length;
                                    } else if (index == 1) {
                                      chipsSelected = [false, true, false, false];
                                      filterLength = 0;
                                      filter = 'PLANT';
                                      for(int i = 0; i < cubit.productsModel!.products!.length; i++){
                                        if (filter == cubit.productsModel!.products![i].type) {
                                          filteredList.add(cubit.productsModel!.products![i]);
                                          filterLength++;
                                        }
                                      }
                                    } else if (index == 2) {
                                      chipsSelected = [false, false, true, false];
                                      filterLength = 0;

                                      filter = 'SEED';
                                      for(int i = 0; i < cubit.productsModel!.products!.length; i++){
                                        if (filter == cubit.productsModel!.products![i].type) {
                                          filteredList.add(cubit.productsModel!.products![i]);

                                          filterLength++;
                                        }
                                      }
                                    } else if (index == 3) {
                                      chipsSelected = [false, false, false, true];
                                      filterLength = 0;

                                      filter = 'TOOL';
                                      for(int i = 0; i < cubit.productsModel!.products!.length; i++){
                                        if (filter == cubit.productsModel!.products![i].type) {
                                          filteredList.add(cubit.productsModel!.products![i]);

                                          filterLength++;
                                        }
                                      }
                                    }

                                    print('sdasda $filterLength');
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
                      cubit.productsModel!.products!.isNotEmpty
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 300,
                                      childAspectRatio: 3 / 6,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: filteredList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return HomeCard(
                                  data: filteredList[index]
                                );
                              })
                          : Space(height: 0, width: 0),

                      // //Seeds Gridview
                      // cubit.seedModel!.data!.isNotEmpty &&
                      //         (chipsSelected[0] || chipsSelected[2])
                      //     ? GridView.builder(
                      //         shrinkWrap: true,
                      //         physics: const NeverScrollableScrollPhysics(),
                      //         gridDelegate:
                      //             const SliverGridDelegateWithMaxCrossAxisExtent(
                      //           maxCrossAxisExtent: 300,
                      //           childAspectRatio: 3 / 6,
                      //           crossAxisSpacing: 10,
                      //           mainAxisSpacing: 10,
                      //         ),
                      //         itemCount: cubit.seedModel!.data!.length,
                      //         itemBuilder: (BuildContext ctx, index) {
                      //           return SeedCard(
                      //             seed: cubit.seedModel!.data![index],
                      //           );
                      //         },
                      //       )
                      //     : Space(height: 0, width: 0),
                      //
                      // //Tools Gridview
                      // cubit.toolModel!.data!.isNotEmpty &&
                      //         (chipsSelected[0] || chipsSelected[3])
                      //     ? GridView.builder(
                      //         shrinkWrap: true,
                      //         physics: const NeverScrollableScrollPhysics(),
                      //         gridDelegate:
                      //             const SliverGridDelegateWithMaxCrossAxisExtent(
                      //           maxCrossAxisExtent: 300,
                      //           childAspectRatio: 3 / 6,
                      //           crossAxisSpacing: 10,
                      //           mainAxisSpacing: 10,
                      //         ),
                      //         itemCount: cubit.toolModel!.data!.length,
                      //         itemBuilder: (BuildContext ctx, index) {
                      //           return ToolCard(
                      //             tool: cubit.toolModel!.data![index],
                      //           );
                      //         },
                      //       )
                      //     : Space(height: 0, width: 0),
                    ],
                  ),
                )
              : Loading(color: ColorManager.primary, size: 40),
        );
      },
    ),
);
  }
}
