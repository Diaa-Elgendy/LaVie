import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/screens/authorize/reset_password_screen.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:la_vie/view_model/authorize_cubit/authorize_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../widgets/custom_button.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String email;

  const VerifyOTPScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  TextEditingController otpCtrl = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthorizeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Space(height: 30),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(AssetsManager.otp),
                    ),
                  ),
                  Space(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Email address Verification',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                          text: "Enter the code sent to ",
                          children: [
                            TextSpan(
                                text: widget.email,
                                style: getMediumStyle(
                                    color: ColorManager.primary)),
                          ],
                          style: getRegularStyle()),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Space(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle:
                              getSemiBoldStyle(color: ColorManager.textColor),
                          length: 6,
                          animationType: AnimationType.fade,
                          // validator: (v) {
                          //   if (v!.length < 3) {
                          //     return "I'm from validator";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius:
                                BorderRadius.circular(AppSize.borderRadius),
                            borderWidth: AppSize.borderWidth,
                            activeFillColor: Colors.white,
                            inactiveColor: Colors.white,
                            activeColor: Colors.white,
                            selectedColor: ColorManager.primary,
                            disabledColor: Colors.white,
                            inactiveFillColor: ColorManager.primaryLight,
                            selectedFillColor: ColorManager.primaryLight,
                          ),
                          cursorColor: ColorManager.primary,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: otpCtrl,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              currentText = value;
                            });
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? "Please Apply The OTP Code." : "",
                      style: getRegularStyle(color: ColorManager.toastError),
                    ),
                  ),
                  Space(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the code? ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () => showSnackBar("OTP resend!!", context),
                        child: Text(
                          "RESEND",
                          style: getSemiBoldStyle(color: ColorManager.primary),
                        ),
                      )
                    ],
                  ),
                  Space(height: 14),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.shade200,
                              offset: const Offset(1, -2),
                              blurRadius: 5),
                          BoxShadow(
                              color: Colors.green.shade200,
                              offset: const Offset(-1, 2),
                              blurRadius: 5)
                        ]),
                    child: ButtonTheme(
                      height: 50,
                      child: CustomButton(
                        function: () {
                          formKey.currentState!.validate();
                          // conditions for validating
                          if (currentText.length != 6) {
                            errorController!.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() => hasError = true);
                          } else {
                            setState(
                              () {
                                hasError = false;
                                navigateTo(context: context, widget: ResetPasswordScreen(email: widget.email,otp: otpCtrl.text,));
                                // cubit.postVerifyOTP(
                                //     email: widget.email, otp: otpCtrl.text);
                              },
                            );
                          }
                        },
                        child: state is VerifyOtpLoading
                            ? Loading()
                            : Text(
                                "VERIFY",
                                style: getMediumStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  Space(
                    height: 16,
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
