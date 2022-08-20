import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/authorize_cubit/authorize_cubit.dart';

import '../../../view_model/app/functions.dart';
import '../../../view_model/shared_pref/cache_helper.dart';
import '../../../view_model/shared_pref/cache_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/string_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../navigation_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final signupFirstNameCtrl = TextEditingController(text: 'First name');
  final signupLastNameCtrl = TextEditingController(text: 'Last name');
  final signupEmailCtrl = TextEditingController(text: 'diaa1@gmail.com');
  final signupPasswordCtrl = TextEditingController(text: 'asdda');

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          CacheHelper.putData(CacheManager.accessToken, state.userModel.data!.accessToken);
          CacheHelper.putData(CacheManager.refreshToken, state.userModel.data!.refreshToken);
          StringManager.userToken = state.userModel.data!.accessToken!;
          show("Token: ${StringManager.userToken}");
          navigateAndFinish(context, const NavigationScreen());
        }
      },
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: signupFirstNameCtrl,
                          label: 'First Name',
                        ),
                      ),
                      Space(),
                      Expanded(
                        child: CustomTextField(
                          controller: signupLastNameCtrl,
                          label: 'Last Name',
                        ),
                      ),
                    ],
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
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
                      ),
                    ],
                  ),
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
                        '  Or Continue with  ',
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
