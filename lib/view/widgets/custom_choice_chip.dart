import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';

class CustomChoiceChip extends StatefulWidget {
  String text;
  bool isSelected;
  VoidCallback onSelected;
  final ValueSetter<bool>? onChange;
  CustomChoiceChip(
      {required this.text,  required this.isSelected, required this.onSelected, this.onChange, Key? key,})
      : super(key: key);

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        widget.text,
        style: getMediumStyle(
            color: widget.isSelected
                ? ColorManager.primary
                : ColorManager.grey),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      selected: widget.isSelected,
      selectedColor: ColorManager.white,
      backgroundColor: ColorManager.greyLight,
      shape: widget.isSelected
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
        widget.onSelected();
        widget.onChange?.call(value);
      },
    );
  }
}
