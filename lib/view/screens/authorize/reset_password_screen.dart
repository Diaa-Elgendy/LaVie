import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/authorize_cubit/authorize_cubit.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'authorize_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({required this.email,required this.otp, Key? key}) : super(key: key);
  String email;
  String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordCtrl = TextEditingController();

  final TextEditingController emailCtrl = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailCtrl.text = widget.email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          navigateAndFinish(context, const AuthorizeScreen());
        }
      },
      builder: (context, state) {
        AuthorizeCubit cubit = BlocProvider.of(context);

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset Your Password',
                    style: getSemiBoldStyle(fontSize: 50),
                  ),
                  Space(height: 30),
                  RichText(
                    text: TextSpan(
                        text: "Enter Your New Password.",
                        children: [
                          TextSpan(
                              text: widget.email,
                              style: getMediumStyle(
                                  color: ColorManager.primary, fontSize: FontSize.f18)),
                        ],
                        style: getRegularStyle(fontSize: FontSize.f18, color: ColorManager.grey)),
                    textAlign: TextAlign.start,
                  ),
                  Space(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [

                        CustomTextField(
                            controller: passwordCtrl, label: 'New Password'),

                      ],
                    ),
                  ),
                  Space(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.postResetPassword(email: widget.email, otp: widget.otp, password: passwordCtrl.text);
                            }
                          },
                          child: state is ResetPasswordLoading
                              ? Loading()
                              : Text(
                            'Reset Password',
                            style: getMediumStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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
