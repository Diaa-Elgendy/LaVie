import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/widgets/view_product_item.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';
import '../../../model/cart/cart_model.dart';
import '../../resources/values_manager.dart';

class ViewProductScreen extends StatefulWidget {
  var data;
  int quantity;
  ViewProductScreen({required this.data,required this.quantity, Key? key}) : super(key: key);

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {

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

    //todo: apply cart functionalities here

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 350,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: CustomNetworkImage(
                  image: type.imageUrl,
                  radius: 0,
                  fit: BoxFit.fill,
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(
                    color: ColorManager.white
                ),
              ),

            ],
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

                //Quantity and add to cart
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    CartCubit cartCubit = BlocProvider.of(context);
                    return Column(
                      children: [
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
                                  if (widget.quantity > 0) {
                                    widget.quantity--;
                                  }
                                  cartCubit.changeCount(widget.data.productId, widget.quantity);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: ColorManager.grey,
                                  size: 16,
                                ),
                              ),
                            ),
                            Text(
                              '  ${widget.quantity}  ',
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
                                    widget.quantity++;
                                  cartCubit.changeCount(widget.data.productId, widget.quantity);

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
                              function: () {
                                cartCubit.addToCart(
                                  CartModel(
                                    productId: widget.data.productId,
                                    name: type.name,
                                    image: type.imageUrl,
                                    price: widget.data.price,
                                    count: widget.quantity,
                                  ),
                                ).then((value){
                                  Navigator.of(context).pop(widget.quantity);
                                });
                              },
                              text: 'ADD TO CART',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
/*

 */