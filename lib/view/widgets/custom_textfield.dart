import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/view/resources/color_manager.dart';
import 'package:la_vie/view/resources/font_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/app/enums.dart';


class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool isPassword;
  VoidCallback? suffixPressed;
  IconData? suffix;
  IconData? prefix;
  int maxLines;
  bool readOnly;

  CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.isPassword = false,
      this.suffixPressed,
      this.suffix,
      this.readOnly = false,
      this.prefix,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getMediumStyle(fontSize: FontSize.f14),
        ),
        Space(height: 5),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: prefix != null
                ? Icon(
                    prefix,
                    color: ColorManager.primary,
                    size: 20,
                  )
                : null,
            isDense: false,
            contentPadding: const EdgeInsets.all(15),
            suffixIcon: suffix != null
                ? IconButton(
                    icon: Icon(suffix),
                    onPressed: suffixPressed,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: const BorderSide(color: ColorManager.primaryLight, width: 2),
            ),


          ),
          scrollPadding: const EdgeInsets.all(0),
          style: getRegularStyle(),
          controller: controller,

          obscureText: isPassword,
          minLines: 1,

          maxLines: maxLines,

          textAlignVertical: TextAlignVertical.center,
          cursorColor: ColorManager.primary,
          readOnly: readOnly ,
          enabled: readOnly ? false : true,
          validator: (value) {
            if (value!.isEmpty) {
              return '$label must not be empty';
            }
            return null;
          },
        ),
      ],
    );
  }
}
