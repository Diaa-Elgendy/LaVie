import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/routes_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/screens/authorize/cubit/authorize_cubit.dart';
import 'package:la_vie/presenation/screens/home/home_screen.dart';
import 'package:la_vie/presenation/screens/navigation_screen.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:la_vie/presenation/widgets/custom_button.dart';
import 'package:la_vie/presenation/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginEmailCtrl = TextEditingController(text: 'user@gmail.com');
  final loginPasswordCtrl = TextEditingController(text: 'User123#');
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          navigateAndFinish( context, const NavigationScreen());
        }
      },
      builder: (context, state) {
        AuthorizeCubit cubit = BlocProvider.of(context);
        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    controller: loginEmailCtrl,
                    label: 'Email',
                  ),
                  Space(height: 30),
                  CustomTextField(
                    controller: loginPasswordCtrl,
                    label: 'password',
                  ),
                  Space(height: 30),
                  CustomButton(
                      child: state is LoginLoading ? Loading() :Text(
                        'Login',
                        style: getMediumStyle(
                            color: ColorManager.white, fontSize: FontSize.f18),
                      ),
                      function: () {
                        if (loginFormKey.currentState!.validate()) {
                          cubit.postLogin(
                              email: loginEmailCtrl.text,
                              password: loginPasswordCtrl.text);
                        }
                      }),
                  Space(height: 30),
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: ColorManager.grey,
                          )),
                      Text(
                        'Or Continue with',
                        style: getRegularStyle(fontSize: FontSize.f12),
                      ),
                      const Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: ColorManager.grey,
                          )),
                    ],
                  ),
                  Space(height: 15),
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

