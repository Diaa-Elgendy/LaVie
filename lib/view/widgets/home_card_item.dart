import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/cart/cart_model.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/view_product/view_product_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import 'components.dart';
import 'custom_button.dart';

class HomeCard extends StatefulWidget {
  var data;

  HomeCard({Key? key, required this.data}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  int count = 1;

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

    return Card(
      child: InkWell(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ViewProductScreen(data: widget.data, quantity: count)),
          );
          setState(() {
            count = result;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomNetworkImage(image: type.imageUrl!),
                    ),
                    Space(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.greyLight,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              if (count > 0) {
                                setState(() {
                                  count--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: ColorManager.grey,
                              size: 14,
                            ),
                          ),
                        ),
                        Space(height: 5),
                        Text(
                          '  $count  ',
                          style: getMediumStyle(fontSize: FontSize.f14),
                        ),
                        Space(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.greyLight,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: ColorManager.grey,
                              size: 14,
                            ),
                            color: ColorManager.greyLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Space(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${type.name!.toUpperCase()} ",
                  style: getMediumStyle(color: ColorManager.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Space(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.data.price} EGP    '.toUpperCase(),
                  style: getRegularStyle(fontSize: FontSize.f14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Space(height: 10),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  CartCubit cartCubit = BlocProvider.of(context);
                  return Center(
                      child: CustomButton(
                    text: 'Add To Card',
                    function: () {
                      cartCubit.addToCart(
                        CartModel(
                          productId: widget.data.productId,
                          name: type.name,
                          image: type.imageUrl,
                          price: widget.data.price,
                          count: count,
                        ),
                      );
                      //print(cartCubit.cartList.length);
                    },
                    fontSize: FontSize.f14,
                    height: 35,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
