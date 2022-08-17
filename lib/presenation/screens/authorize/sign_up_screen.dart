import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/screens/authorize/cubit/authorize_cubit.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:la_vie/presenation/widgets/custom_button.dart';
import 'package:la_vie/presenation/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final signupFirstNameCtrl = TextEditingController(text: 'First name');
  final signupLastNameCtrl = TextEditingController(text: 'Last name');
  final signupEmailCtrl = TextEditingController(text: 'diaa1@gmail.com');
  final signupPasswordCtrl = TextEditingController(text: 'asdda');

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
    return BlocBuilder<AuthorizeCubit, AuthorizeState>(
      builder: (context, state) {
        AuthorizeCubit cubit = BlocProvider.of(context);
        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: signupFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Space(),
                  CustomTextField(
                    controller: signupFirstNameCtrl,
                    label: 'First Name',
                  ),
                  Space(height: 25),
                  CustomTextField(
                    controller: signupLastNameCtrl,
                    label: 'Last Name',
                  ),
                  Space(height: 25),
                  CustomTextField(
                    controller: signupEmailCtrl,
                    label: 'Email',
                  ),
                  Space(height: 25),
                  CustomTextField(
                    controller: signupPasswordCtrl,
                    label: 'Password',
                  ),
                  Space(height: 25),
                  CustomButton(
                      child: state is SignupLoading
                          ? Loading()
                          : Text(
                              'Sign up',
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.f18),
                            ),
                      function: () {
                        if (signupFormKey.currentState!.validate()) {
                          cubit.postSignUp(
                              email: signupEmailCtrl.text,
                              password: signupPasswordCtrl.text,
                              firstName: signupFirstNameCtrl.text,
                              lastName: signupLastNameCtrl.text);
                        }
                      }),
                  Space(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: getRegularStyle(fontSize: FontSize.f12),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign in',
                          style: getRegularStyle(
                              fontSize: FontSize.f12,
                              color: ColorManager.primary),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: ColorManager.grey,
                        ),
                      ),
                      Text(
                        'Or Continue with',
                        style: getRegularStyle(fontSize: FontSize.f12),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: ColorManager.grey,
                        ),
                      ),
                    ],
                  ),
                  Space(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(AssetsManager.googleLogo),
                      ),
                      Space(),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          AssetsManager.facebookLogo,
                          width: 15,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
