import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  String text;
  Widget child;
  double fontSize;
  double height;
  VoidCallback function;

  CustomButton(
      {Key? key,
      this.text = '',
      this.child = const SizedBox(height: 0, width: 0),
      required this.function,
      this.fontSize = FontSize.f20,
      this.height = AppSize.buttonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        color: ColorManager.primary,
      ),
      child: MaterialButton(
        onPressed: function,
        child: text.isNotEmpty
            ? Text(
                text,
                style: getMediumStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                ),
              )
            : child,
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  VoidCallback function;
  String text;
  double fontSize;
  double height;

  CustomOutlinedButton(
      {required this.text,
      required this.function,
      this.fontSize = FontSize.f20,
      this.height = AppSize.buttonHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: MaterialButton(
        onPressed: function,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          side: const BorderSide(
            width: AppSize.borderWidth,
            color: ColorManager.primary
          ),
        ),
        elevation: 0,
        child: Text(
          text,
          style: getMediumStyle(color: ColorManager.primary, fontSize: fontSize),
        ),
      ),
    );
  }
}
