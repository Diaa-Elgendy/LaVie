import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/assets_manager.dart';
import 'package:la_vie/view/resources/style_manager.dart';
import 'package:la_vie/view/resources/values_manager.dart';
import 'package:la_vie/view/widgets/components.dart';
import 'package:la_vie/view/screens/authorize/login_screen.dart';
import 'package:la_vie/view/screens/authorize/sign_up_screen.dart';

import '../../resources/color_manager.dart';

class AuthorizeScreen extends StatefulWidget {
  const AuthorizeScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizeScreen> createState() => _AuthorizeScreenState();
}

class _AuthorizeScreenState extends State<AuthorizeScreen>
    with TickerProviderStateMixin {


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
                            LoginScreen(),
                            SignUpScreen(),
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
