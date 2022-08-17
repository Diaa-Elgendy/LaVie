
import 'package:flutter/material.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  String text;
  Widget child;
  double fontSize;
  double height;
  VoidCallback function;
  bool fullWidth;

  CustomButton(
      {Key? key,
        this.text = '',
        this.child = const SizedBox(height: 0, width: 0),
      required this.function,
      this.fontSize = FontSize.f20,
      this.height = AppSize.buttonHeight,
      this.fullWidth = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          color: ColorManager.primary,
        ),
        child: MaterialButton(
          onPressed: function,
          child: text.isNotEmpty ? Text(
            text,
            style: getMediumStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ): child,
        ),
      ),
    );
  }
}
