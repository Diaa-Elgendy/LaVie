import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/authorize/verify_otp_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:la_vie/view_model/authorize_cubit/authorize_cubit.dart';
import 'package:la_vie/view_model/shared_pref/cache_helper.dart';
import 'package:la_vie/view_model/shared_pref/cache_manager.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/string_manager.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../navigation_screen.dart';

class ExamChoice extends StatefulWidget {
  int value;
  int? groupValue;
  String answer;

  ExamChoice({super.key, required this.value, required this.groupValue, required this.answer});

  @override
  State<ExamChoice> createState() => _ExamChoiceState();
}

class _ExamChoiceState extends State<ExamChoice> {
  RadioGroupController myController = RadioGroupController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          border: Border.all(
              color: ColorManager.primary, width: AppSize.borderWidth)),
      padding: const EdgeInsets.all(AppPadding.cardPadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.answer,
              style: getMediumStyle(fontSize: FontSize.f20),
            ),
          ),
          Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: (value) {
              widget.groupValue = value as int;
              setState(() {});
            },
            activeColor: ColorManager.primary,
          )
        ],
      ),
    );
  }
}
