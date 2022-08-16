import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/business_logic/enums.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/routes_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';
import 'package:la_vie/presenation/screens/navigation_screen.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:la_vie/presenation/widgets/custom_button.dart';
import 'package:la_vie/presenation/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final loginEmailCtrl = TextEditingController();
  final loginPasswordCtrl = TextEditingController();
  final signupPasswordCtrl = TextEditingController();
  final signupFirstNameCtrl = TextEditingController();
  final signupLastNameCtrl = TextEditingController();
  final signupPasswordConfirmCtrl = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.screenPadding),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Todo center screen
                      Space(height: 100),

                      Image.asset(
                        AssetsManager.logo,
                        width: 100,
                      ),
                      Space(height: 50),
                      ButtonsTabBar(
                        labelSpacing: 200,
                        borderColor: ColorManager.grey,
                        unselectedBackgroundColor: ColorManager.white,
                        buttonMargin:
                            const EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                        unselectedLabelStyle:
                            getRegularStyle(color: ColorManager.grey),
                        unselectedBorderColor: ColorManager.white,
                        backgroundColor: ColorManager.white,
                        labelStyle:
                            getRegularStyle(color: ColorManager.primary),
                        splashColor: Colors.green.shade50,
                        tabs: const [
                          Tab(
                            text: 'Login',
                          ),
                          Tab(
                            text: 'Signup',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Center(
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
                                          text: 'Login',
                                          function: () {
                                            navigateTo(context: context, widget: const NavigationScreen());
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
                                            style: getRegularStyle(
                                                fontSize: FontSize.f12),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                                AssetsManager.googleLogo),
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
                            ),
                            Center(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Form(
                                  key: signupFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
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
                                        controller: signupPasswordCtrl,
                                        label: 'Password',
                                      ),
                                      Space(height: 25),
                                      CustomTextField(
                                        controller: signupPasswordConfirmCtrl,
                                        label: 'Confirm Password',
                                      ),
                                      Space(height: 25),
                                      CustomButton(
                                          text: 'Sign up',
                                          function: () {
                                            if (signupFormKey.currentState!
                                                .validate()) {}
                                          }),
                                      Space(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Already have an account?',
                                            style: getRegularStyle(
                                                fontSize: FontSize.f12),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Sign in',
                                              style: getRegularStyle(
                                                  fontSize: FontSize.f12,
                                                  color: ColorManager.primary),
                                            ),
                                          ),
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
                                            style: getRegularStyle(
                                                fontSize: FontSize.f12),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                                AssetsManager.googleLogo),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              right: -5,
              child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(15 / 360),
                  child: Image.asset(
                    AssetsManager.tree,
                    width: 100,
                  )),
            ),
            Positioned(
              bottom: -10,
              left: 0,
              child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(180 / 360),
                  child: Image.asset(
                    AssetsManager.tree,
                    width: 100,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
