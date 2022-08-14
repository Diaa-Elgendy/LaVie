import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/business_logic/enums.dart';
import 'package:la_vie/presenation/resources/assets_manager.dart';
import 'package:la_vie/presenation/resources/color_manager.dart';
import 'package:la_vie/presenation/resources/font_manager.dart';
import 'package:la_vie/presenation/resources/style_manager.dart';
import 'package:la_vie/presenation/resources/values_manager.dart';
import 'package:la_vie/presenation/widgets/components.dart';
import 'package:la_vie/presenation/widgets/custom_button.dart';
import 'package:la_vie/presenation/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  IconData passwordIcon = Icons.visibility;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: DefaultTabController(
            length: 2,
            child: Container(
              color: Colors.grey.shade100,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    ImageAssets.logo,
                    width: 100,
                  ),
                  Space(height: 50),
                  ButtonsTabBar(
                    backgroundColor: ColorManager.offWhite,
                    unselectedBackgroundColor: ColorManager.offWhite,
                    unselectedLabelStyle:
                        getRegularStyle(color: ColorManager.grey),
                    labelStyle: getRegularStyle(color: ColorManager.primary),
                    splashColor: Colors.green.shade100,
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
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.screenPadding),
                      child: TabBarView(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: getMediumStyle(),
                              ),
                              Space(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  isDense: false,
                                  contentPadding: const EdgeInsets.all(
                                      AppPadding.cardPadding),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSize.borderRadius)),
                                  labelStyle: getRegularStyle(
                                      color: ColorManager.textColorLight),
                                ),
                                scrollPadding: const EdgeInsets.all(0),
                                style: getRegularStyle(),
                                minLines: 1,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: ColorManager.primary,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '$value must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          Center(
                            child: Icon(Icons.directions_transit),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
