import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/screens/view_product/view_product_component.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import '../../resources/values_manager.dart';

class ViewProductScreen extends StatefulWidget {
  var data;

  ViewProductScreen({required this.data, Key? key}) : super(key: key);

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    var type;
    if (widget.data.type == 'PLANT') {
      type = widget.data.plant;
    } else if (widget.data.type == 'SEED') {
      type = widget.data.seed;
    } else if (widget.data.type == 'TOOL') {
      type = widget.data.tool;
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: CustomNetworkImage(
              image: type.imageUrl,
              radius: 0,
              fit: BoxFit.fill,
            ),
          ),
          Space(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${type.name} (${widget.data.name})',
                  style: getSemiBoldStyle(fontSize: FontSize.f26),
                ),
                Space(height: 10),
                Text(
                  '${widget.data.price} EGP',
                  style: getSemiBoldStyle(
                      fontSize: FontSize.f20, color: ColorManager.primary),
                ),
                Space(),

                //Value card for plants only.
                if (widget.data.type == 'PLANT')
                  Row(
                    children: [
                      ValuesCardForPlant(
                          label: 'Sun light',
                          superScript: '%',
                          value: type.sunLight,
                          image: AssetsManager.sunIcon),
                      Space(width: 5),
                      ValuesCardForPlant(
                          label: 'Water',
                          superScript: '%',
                          value: type.waterCapacity,
                          image: AssetsManager.waterIcon),
                      Space(width: 5),
                      ValuesCardForPlant(
                          label: 'Temp.',
                          superScript: 'C',
                          value: type.temperature,
                          image: AssetsManager.tempIcon),
                    ],
                  ),
                Space(),

                const Divider(color: ColorManager.primaryLight, thickness: 0.5),
                Space(),

                //Description Section
                Text(
                  'Description',
                  style: getSemiBoldStyle(fontSize: FontSize.f20),
                ),
                Space(),
                Row(
                  children: [
                    Space(),
                    Text(
                      '${type.description}.',
                      style: getRegularStyle(),
                    ),
                  ],
                ),
                Space(),

                const Divider(color: ColorManager.primaryLight, thickness: 0.5),
                Space(),

                Row(
                  children: [
                    Text(
                      'Qty: ',
                      style: getMediumStyle(fontSize: FontSize.f20),
                    ),
                    Space(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ColorManager.greyLight,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          if (quantity>0) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: ColorManager.grey,
                          size: 16,
                        ),
                      ),
                    ),
                    Text(
                      '  $quantity  ',
                      style: getSemiBoldStyle(fontSize: FontSize.f18),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ColorManager.greyLight,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
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
                Space(height: 30),

                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: CustomButton(
                      function: () {},
                      text: 'ADD TO CART',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
