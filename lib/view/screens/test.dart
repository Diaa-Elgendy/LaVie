import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/model/home/product_model.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/routes_manager.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/buy_plant/buy_plant.dart';
import 'package:la_vie/view/screens/cart/cart_screen.dart';
import 'package:la_vie/view/screens/exam/exam_screen.dart';
import 'package:la_vie/view/screens/forums/forums_screen.dart';
import 'package:la_vie/view/widgets/home_card_item.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/custom_choice_chip.dart';
import 'package:la_vie/view/widgets/empty_page.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';
import 'package:la_vie/view_model/home_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List<Product> filteredList = [];
  String filter = 'ALL';
  int filterLength = 0;

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context, listen: true);
    var customState;
    show('User Token:: ${StringManager.userToken}');
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            customState = state;
            if (state is GetProductsSuccess) {
              filterLength = state.productsModel.products!.length;
              filteredList.addAll(state.productsModel.products!);
            }
          },
        ),
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {

          },
        )
      ],
      child: Scaffold(
        body: customState is GetProductsSuccess
            ? cubit.productsModel!.products!.isNotEmpty
            ? SafeArea(
          child: ListView(
            padding:
            const EdgeInsets.all(AppPadding.screenPadding),
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
                    child: Row(
                      children: [
                        Card(
                          shape: const CircleBorder(),
                          elevation: AppSize.elevation,
                          color: ColorManager.greyLight,
                          child: IconButton(
                            padding: const EdgeInsets.all(5),
                            onPressed: () {
                              navigateTo(
                                  context: context,
                                  widget: BuyPlant());
                            },
                            icon: const Icon(
                                Icons.location_on_outlined,
                                size: 18),
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        Card(
                          shape: const CircleBorder(),
                          elevation: AppSize.elevation,
                          color: ColorManager.greyLight,
                          child: IconButton(
                            padding: const EdgeInsets.all(5),
                            onPressed: () {
                              navigateTo(
                                  context: context,
                                  widget: const ExamScreen());
                            },
                            icon: const Icon(
                                Icons.question_mark_outlined,
                                size: 18),
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Card(
                      shape: const CircleBorder(),
                      elevation: AppSize.elevation,
                      color: ColorManager.primary,
                      child: IconButton(
                        padding: const EdgeInsets.all(5),
                        onPressed: () {
                          navigateTo(
                              context: context,
                              widget: const ForumsScreen());
                        },
                        icon: const Icon(
                          Icons.chrome_reader_mode_outlined,
                          size: 18,
                          color: ColorManager.white,
                        ),
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
                          hintStyle: getRegularStyle(
                            color: ColorManager.grey,
                          ),
                          contentPadding: const EdgeInsets.all(8),
                          fillColor: Colors.red,
                        ),
                        controller: searchCtrl,
                        maxLines: 1,
                        style: getRegularStyle(
                            fontSize: FontSize.f16),
                        cursorColor: ColorManager.primary,
                      ),
                    ),
                  ),
                  Space(),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      CartCubit cartCubit =
                      BlocProvider.of(context);
                      return Badge(
                        badgeContent: Text(
                          '${cartCubit.cart.length}',
                          style: getRegularStyle(
                              color: ColorManager.white),
                        ),
                        padding: const EdgeInsets.all(7),
                        badgeColor: ColorManager.primaryLight,
                        showBadge: cartCubit.cart.isNotEmpty
                            ? true
                            : false,
                        position: const BadgePosition(
                            top: -15, end: -10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(
                                  AppSize.borderRadius)),
                          child: IconButton(
                            onPressed: () {
                              navigateTo(
                                  context: context,
                                  widget: const CartScreen());
                            },
                            icon: const ImageIcon(
                                AssetImage(
                                    AssetsManager.cartIcon),
                                color: ColorManager.white),
                          ),
                        ),
                      );
                    },
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
                    return CustomChoiceChip(
                      text: chipsTitle[index],
                      isSelected: chipsSelected[index],
                      onSelected: () {
                        setState(() {
                          filteredList.clear();
                          if (index == 0) {
                            chipsSelected = [
                              true,
                              false,
                              false,
                              false
                            ];
                            filterLength = 0;

                            filter = 'ALL';
                            filteredList.addAll(
                                cubit.productsModel!.products!);

                            filterLength = cubit
                                .productsModel!.products!.length;
                          } else if (index == 1) {
                            chipsSelected = [
                              false,
                              true,
                              false,
                              false
                            ];
                            filterLength = 0;
                            filter = 'PLANT';
                            for (int i = 0;
                            i <
                                cubit.productsModel!.products!
                                    .length;
                            i++) {
                              if (filter ==
                                  cubit.productsModel!
                                      .products![i].type) {
                                filteredList.add(cubit
                                    .productsModel!.products![i]);
                                filterLength++;
                              }
                            }
                          } else if (index == 2) {
                            chipsSelected = [
                              false,
                              false,
                              true,
                              false
                            ];
                            filterLength = 0;

                            filter = 'SEED';
                            for (int i = 0;
                            i <
                                cubit.productsModel!.products!
                                    .length;
                            i++) {
                              if (filter ==
                                  cubit.productsModel!
                                      .products![i].type) {
                                filteredList.add(cubit
                                    .productsModel!.products![i]);

                                filterLength++;
                              }
                            }
                          } else if (index == 3) {
                            chipsSelected = [
                              false,
                              false,
                              false,
                              true
                            ];
                            filterLength = 0;

                            filter = 'TOOL';
                            for (int i = 0;
                            i <
                                cubit.productsModel!.products!
                                    .length;
                            i++) {
                              if (filter ==
                                  cubit.productsModel!
                                      .products![i].type) {
                                filteredList.add(cubit
                                    .productsModel!.products![i]);

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
                  physics:
                  const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 4.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return HomeCard(
                        data: filteredList[index]);
                  })
                  : Space(height: 0, width: 0),
            ],
          ),
        )
            : EmptyPage(
          header: 'No Items To Shop Yet!',
          body: 'Please Wait For More Products Soon.',
        )
            : customState is GetProductsLoading
            ? Loading(color: ColorManager.primary, size: 40)
            : ErrorCard(
          function: () {
            cubit.getProducts();
          },
          title: 'Error while getting data',
        ),
      ),
    );
  }
}
