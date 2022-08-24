import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';
import 'package:la_vie/view_model/cart_cubit/cart_cubit.dart';

import '../../model/cart/cart_model.dart';
import '../resources/assets_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_manager.dart';
import 'components.dart';

class CartItem extends StatefulWidget {
  CartModel model;

  CartItem(
      {Key? key,
      required this.model})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cubit = BlocProvider.of(context);
        return SizedBox(
          height: 160,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.cardPadding),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.borderRadius),
                    child: SizedBox(
                      width: 146,
                      height: 133,
                      child: CustomNetworkImage(
                        image: widget.model.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Space(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.name,
                          style: getMediumStyle(fontSize: FontSize.f18),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Space(height: 8),
                        Text(
                          '${widget.model.price} EGP',
                          style: getMediumStyle(
                              fontSize: FontSize.f14,
                              color: ColorManager.primary),
                          maxLines: 1,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.borderRadius),
                                  color: ColorManager.greyLight,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                          if (widget.model.count > 1) {
                                            widget.model.count--;
                                          }
                                          cubit.changeCount(widget.model.productId, widget.model.count);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: ColorManager.primary,
                                        size: 14,
                                      ),
                                      constraints: const BoxConstraints(),
                                    ),
                                    Text(
                                      '${widget.model.count}',
                                      style:
                                          getMediumStyle(fontSize: FontSize.f14),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                          widget.model.count++;
                                          cubit.changeCount(widget.model.productId, widget.model.count);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: ColorManager.primary,
                                        size: 14,
                                      ),
                                      constraints: BoxConstraints(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                  cubit.deleteItem(widget.model);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: ColorManager.primary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

