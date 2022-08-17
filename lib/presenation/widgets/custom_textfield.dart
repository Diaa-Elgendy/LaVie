import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:la_vie/app/enums.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/values_manager.dart';

// class CustomTextField extends StatelessWidget {
//   TextEditingController controller;
//   String label;
//   int maxLines;
//   const CustomTextField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: getMediumStyle(),
//         ),
//         Space(height: 5),
//         TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             isDense: false,
//             contentPadding: const EdgeInsets.all(
//                 AppPadding.cardPadding),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                     AppSize.borderRadius)),
//             labelStyle: getRegularStyle(
//                 color: ColorManager.textColorLight),
//           ),
//           scrollPadding: const EdgeInsets.all(0),
//           style: getRegularStyle(),
//           minLines: maxLines,
//           textAlignVertical: TextAlignVertical.center,
//           cursorColor: ColorManager.primary,
//           validator: (value) {
//             if (value!.isEmpty) {
//               return '$value must not be empty';
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool isPassword;
  VoidCallback? suffixPressed;
  IconData? suffix;
  IconData? prefix;
  TextFieldType textFieldType;
  int maxLines;

  CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.textFieldType = TextFieldType.text,
      this.isPassword = false,
      this.suffixPressed,
      this.suffix,
      this.prefix,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    TextInputType textInputType;
    bool readOnly = false;
    VoidCallback onTap = () {};

    if (textFieldType == TextFieldType.date) {
      textInputType = TextInputType.datetime;
      prefix = Icons.date_range;
      readOnly = true;
      onTap = () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(1980, 3, 5),
            maxTime: DateTime(2025, 12, 30), onConfirm: (date) {
          controller.text = DateFormat('yyyy-MM-dd').format(date);
        });
      };
    } else if (textFieldType == TextFieldType.time) {
      textInputType = TextInputType.datetime;
      prefix = FontAwesomeIcons.clock;
      readOnly = true;
      onTap = () {
        DatePicker.showTime12hPicker(context,
            showTitleActions: true,
            currentTime: DateTime.now(), onChanged: (time) {
          //debugPrint(DateFormat('hh:mm a').format(time));
        }, onConfirm: (time) {
          controller.text = DateFormat('hh:mm a').format(time).toString();
        });
      };
    } else {
      textInputType = TextInputType.text;
    }

    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Column(
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
                borderSide: const BorderSide(color: ColorManager.grey, width: 2),
              ),

            ),
            scrollPadding: const EdgeInsets.all(0),
            keyboardType: textInputType,
            style: getRegularStyle(),
            controller: controller,
            obscureText: isPassword,
            minLines: 1,
            maxLines: maxLines,
            textAlignVertical: TextAlignVertical.center,
            onTap: onTap,
            cursorColor: ColorManager.primary,
            readOnly: readOnly,
            validator: (value) {
              if (value!.isEmpty) {
                return '$label must not be empty';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
