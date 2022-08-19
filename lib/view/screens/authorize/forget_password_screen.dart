import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/authorize/verify_otp_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/authorize_cubit/authorize_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          navigateTo(
              context: context, widget: VerifyOTPScreen(email: emailCtrl.text));
        }
      },
      builder: (context, state) {
        AuthorizeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Forget Password'),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.screenPadding),
              child: Column(
                children: [
                  Text(
                    'Forget Password?',
                    style: getSemiBoldStyle(fontSize: 50),
                  ),
                  Space(height: 30),
                  Text(
                    'Enter the email address associated with your account.',
                    style: getMediumStyle(
                        fontSize: FontSize.f18, color: ColorManager.grey),
                  ),
                  Space(height: 30),
                  Form(
                    key: formKey,
                    child:
                        CustomTextField(controller: emailCtrl, label: 'Email'),
                  ),
                  Space(height: 30),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: CustomButton(
                      function: () {
                        //todo: Activate postForgetPassword

                        navigateTo(
                            context: context,
                            widget: VerifyOTPScreen(email: emailCtrl.text));
                        // if (formKey.currentState!.validate()) {
                        //   cubit.postForgetPassword(email: emailCtrl.text);
                        // }
                      },
                      child: state is ForgetPasswordLoading
                          ? Loading()
                          : Text(
                              'Forget Password',
                              style: getMediumStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
