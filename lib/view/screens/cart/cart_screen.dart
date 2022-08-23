import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/cart_item.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import 'package:la_vie/view/widgets/empty_page.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';

import '../../../model/cart/cart_model.dart';
import '../../widgets/components.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cubit = BlocProvider.of(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('My Cart'),
              actions: [
                IconButton(
                  onPressed: () {
                    //cubit.clearDatabase();
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            body: cubit.cart.isNotEmpty
                ? ListView(
                    padding: const EdgeInsets.all(AppPadding.screenPadding),
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CartItem(
                            model: cubit.cart[index],
                          );
                        },
                        separatorBuilder: (context, index) => Space(),
                        itemCount: cubit.cart.length,
                      ),
                    ],
                  )
                : EmptyPage(
                    header: 'Your Cart Is Empty',
                    body: 'Bring some plants and product here.',
                  ),
            bottomNavigationBar: cubit.cart.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(AppPadding.screenPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: getMediumStyle(fontSize: FontSize.f24),
                            ),
                            Text(
                              '${cubit.totalPrice} EGP',
                              style: getMediumStyle(
                                  fontSize: FontSize.f24,
                                  color: ColorManager.primary),
                            )
                          ],
                        ),
                        Space(height: 20),
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: CustomButton(
                            function: () {},
                            text: 'Checkout',
                          ),
                        ),
                      ],
                    ),
                  )
                : null);
      },
    );
  }
}
