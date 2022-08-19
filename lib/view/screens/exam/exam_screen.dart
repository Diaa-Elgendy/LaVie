import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/app/functions.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../widgets/custom_button.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  bool answer1 = false;
  int answer2 = 0;
  int answer3 = 0;
  String nextButton = 'Next';

  List<Exam> exam = [
    Exam(
        question: 'What is the user experience? 11',
        answer1:
            'The user experience is how the developer feels about the user. 11',
        answer2:
            'The user experience is how th euser feels about interacting with or experiencing the product. 11',
        answer3:
            'The user experience is the attitude the UX designer has about a product. 11', correctAnswer: 'The user experience is how the developer feels about the user. 11'),
    Exam(
        question: 'What is the user experience? 22',
        answer1:
            'The user experience is how the developer feels about the user. 22',
        answer2:
            'The user experience is how the user feels about interacting with or experiencing the product. 22',
        answer3:
            'The user experience is the attitude the UX designer has about a product. 22',
    correctAnswer: 'The user experience is how the user feels about interacting with or experiencing the product. 22'),
    Exam(
        question: 'What is the user experience? 33',
        answer1:
            'The user experience is how the developer feels about the user. 33',
        answer2:
            'The user experience is how th euser feels about interacting with or experiencing the product. 33',
        answer3:
            'The user experience is the attitude the UX designer has about a product. 33',
    correctAnswer: 'The user experience is the attitude the UX designer has about a product. 33'),
    Exam(
        question: 'What is the user experience? 4',
        answer1:
            'The user experience is how the developer feels about the user. 44 ',
        answer2:
            'The user experience is how th euser feels about interacting with or experiencing the product. 44',
        answer3:
            'The user experience is the attitude the UX designer has about a product. 44',
        correctAnswer:
        'The user experience is the attitude the UX designer has about a product. 44')
  ];
  int currentIndex = 0;
  int totalScore = 0;
  bool isPreviousCorrect = false;
  String? groupValue;

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
                    '${currentIndex + 1}',
                    style: getSemiBoldStyle(
                        fontSize: 36, color: ColorManager.primary),
                  ),
                  Text(
                    '/${exam.length}',
                    style: getMediumStyle(
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    exam[currentIndex].question,
                    style: getMediumStyle(fontSize: FontSize.f20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.borderRadius),
                        border: Border.all(
                            color: ColorManager.primary, width: AppSize.borderWidth)),
                    padding: const EdgeInsets.all(AppPadding.cardPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            exam[currentIndex].answer1,
                            style: getMediumStyle(fontSize: FontSize.f20),
                          ),
                        ),
                        Radio(
                          value: exam[currentIndex].answer1,
                          groupValue: groupValue,
                          onChanged: (value) {
                            groupValue = value as String;
                            setState(() {});
                          },
                          activeColor: ColorManager.primary,
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.borderRadius),
                        border: Border.all(
                            color: ColorManager.primary, width: AppSize.borderWidth)),
                    padding: const EdgeInsets.all(AppPadding.cardPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            exam[currentIndex].answer2,
                            style: getMediumStyle(fontSize: FontSize.f20),
                          ),
                        ),
                        Radio(
                          value: exam[currentIndex].answer2,
                          groupValue: groupValue,
                          onChanged: (value) {
                            groupValue = value as String;
                            setState(() {});
                          },
                          activeColor: ColorManager.primary,
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.borderRadius),
                        border: Border.all(
                            color: ColorManager.primary, width: AppSize.borderWidth)),
                    padding: const EdgeInsets.all(AppPadding.cardPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            exam[currentIndex].answer3,
                            style: getMediumStyle(fontSize: FontSize.f20),
                          ),
                        ),
                        Radio(
                          value: exam[currentIndex].answer3,
                          groupValue: groupValue,
                          onChanged: (value) {
                            groupValue = value as String;
                            setState(() {});
                          },
                          activeColor: ColorManager.primary,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: currentIndex != 0
                      ? CustomOutlinedButton(
                          function: () {
                            currentIndex--;

                            if (currentIndex > 0) {
                              setState(() {
                                if (isPreviousCorrect == true) {
                                  totalScore--;
                                  isPreviousCorrect = false;
                                }
                                nextButton = "Next";
                              });
                            }
                          },
                          text: 'Back',
                          fontSize: FontSize.f16,
                        )
                      : const SizedBox(),
                ),
                Space(),
                Expanded(
                    child: currentIndex != exam.length
                        ? CustomButton(
                            function: () {

                              if (currentIndex < exam.length - 1) {
                                setState(() {

                                  nextButton = 'Next';
                                  if (groupValue == exam[currentIndex].correctAnswer) {
                                    totalScore++;
                                    isPreviousCorrect = true;
                                  }
                                  else{
                                    isPreviousCorrect = false;
                                  }
                                  groupValue = null;
                                });
                              }
                              currentIndex++;
                              if (currentIndex == exam.length - 1) {
                                setState(() {
                                  nextButton = 'Finish';
                                });
                              }

                              if(currentIndex == exam.length) {
                                currentIndex--;
                                showSnackBar('Exam Complete, You hit $totalScore correct answers out of ${exam.length}', context);
                                Navigator.pop(context);
                              }
                              setState(() {

                              });

                              print(currentIndex);
                            },
                            text: nextButton,
                            fontSize: FontSize.f16,
                          )
                        : const SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Exam {
  String question;
  String answer1;
  String answer2;
  String answer3;
  String correctAnswer;

  Exam(
      {required this.question,
      required this.answer1,
      required this.answer2,
      required this.correctAnswer,
      required this.answer3});
}
