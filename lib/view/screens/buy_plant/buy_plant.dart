import 'package:flutter/material.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/custom_button.dart';
import 'package:la_vie/view/widgets/custom_scaffold.dart';
import 'package:la_vie/view/widgets/custom_textfield.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/style_manager.dart';
import '../../widgets/components.dart';

class BuyPlant extends StatefulWidget {
  BuyPlant({Key? key}) : super(key: key);

  @override
  State<BuyPlant> createState() => _BuyPlantState();
}

class _BuyPlantState extends State<BuyPlant> {
  final TextEditingController emailCtrl = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Plant'),
      ),
      body: CustomNetworkChecker(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter your email address to calm your plant for free.',
                style: getMediumStyle(fontSize: 30),
              ),
              Space(height: 40),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(controller: emailCtrl, label: 'Email'),
                    Space(height: 40),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: CustomButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            //End Point is not Working
                          }
                        },
                        child: Text(
                          'Get Plant',
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.f18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
