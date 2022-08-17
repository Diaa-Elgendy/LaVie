import 'package:flutter/material.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  bool answer1 = false;
  int answer2 = 0;
  int answer3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Exam',
          style: getAppBarStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Question ',
                    style: getSemiBoldStyle(fontSize: 36),
                  ),
                  Text(
                    '1 ',
                    style: getSemiBoldStyle(
                        fontSize: 36, color: ColorManager.primary),
                  ),
                  Text(
                    '/10',
                    style: getMediumStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'What is the user Experience?',
                style: getMediumStyle(fontSize: FontSize.f20),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppSize.borderRadius),
                        border: Border.all(
                            color: ColorManager.primary,
                            width: AppSize.borderWidth)),
                    padding: const EdgeInsets.only(
                        left: AppPadding.cardPadding,
                        right: AppPadding.cardPadding,
                        top: 5,
                        bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'What is the user Experience?',
                            style: getMediumStyle(fontSize: FontSize.f20),
                          ),
                        ),
                        Radio<bool>(
                          value: answer1,
                          groupValue: answer1,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              answer1 = value!;
                              print(answer1);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(AppSize.borderRadius),
                        border: Border.all(
                            color: ColorManager.primary,
                            width: AppSize.borderWidth)),
                    padding: const EdgeInsets.only(
                        left: AppPadding.cardPadding,
                        right: AppPadding.cardPadding,
                        top: 5,
                        bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'What is the user Experience?',
                            style: getMediumStyle(fontSize: FontSize.f20),
                          ),
                        ),
                        Radio<bool>(
                          value: answer1,
                          groupValue: answer1,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              answer1 = value!;
                              print(answer1);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(AppSize.borderRadius),
                        border: Border.all(
                            color: ColorManager.primary,
                            width: AppSize.borderWidth)),
                    padding: const EdgeInsets.only(
                        left: AppPadding.cardPadding,
                        right: AppPadding.cardPadding,
                        top: 5,
                        bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'What is the user Experience?',
                            style: getMediumStyle(fontSize: FontSize.f20),
                          ),
                        ),
                        Radio<bool>(
                          value: answer1,
                          groupValue: answer1,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              answer1 = value!;
                              print(answer1);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
