import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:la_vie/view_model/authorize_cubit/authorize_cubit.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_helper.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/string_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../navigation_screen.dart';
import 'forget_password_screen.dart';

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
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: CustomButton(
                      child: state is LoginLoading
                          ? Loading()
                          : Text(
                              'Login',
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.f18),
                            ),
                      function: () {
                        if (loginFormKey.currentState!.validate()) {
                          cubit.postLogin(
                              email: loginEmailCtrl.text,
                              password: loginPasswordCtrl.text);
                        }
                      },
                    ),
                  ),
                  Space(height: 10),
                  TextButton(
                    onPressed: () {
                      // navigateTo(
                      //     context: context,
                      //     widget:  ForgetPasswordScreen());
                      navigateTo(context: context, widget: ForgetPasswordScreen());

                    },
                    child: Text(
                      'Forget Password?',
                      style: getRegularStyle(
                          color: ColorManager.primary, fontSize: FontSize.f14),
                    ),
                  ),
                  Space(height: 10),
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
