import 'package:flutter/material.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppPadding.screenPadding),
          children: [
            Image.asset(
              AssetsManager.logo,
              height: 50,
            ),
            Space(height: 30),
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
                        hintStyle: getRegularStyle(color: ColorManager.grey),
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
                    icon: const ImageIcon(AssetImage(AssetsManager.cartIcon),
                        color: ColorManager.white),
                  ),
                )
              ],
            ),
            Space(height: 30),
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
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
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
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 50),
                itemCount: 5,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.cardPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    AssetsManager.plant1,
                                    width: 80,
                                    height: 140,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorManager.greyLight,
                                    borderRadius: BorderRadius.circular(
                                        2),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: ColorManager.grey,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Text(' 1 ',style: getMediumStyle(color: ColorManager.black),),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorManager.greyLight,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),

                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: ColorManager.grey,
                                      size: 16,
                                    ),
                                    color: ColorManager.greyLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Space(),
                          Text('Garden Plant'.toUpperCase(), style: getMediumStyle(color: ColorManager.black),),
                          Space(height: 5),
                          Text('70 EGP'.toUpperCase(), style: getRegularStyle(color: ColorManager.black, fontSize: FontSize.f12),),
                          Space(height: 7),
                          Center(child: CustomButton(text: 'Add To Card', function: (){}, fontSize: FontSize.f16, height: 35,))
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
