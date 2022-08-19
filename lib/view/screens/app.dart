import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/resources/theme_manager.dart';
import 'package:la_vie/view/screens/splash_screen.dart';
import 'package:la_vie/view/screens/test_screen.dart';
import 'package:la_vie/view_model/home_cubit/home_cubit.dart';
import 'package:la_vie/view_model/proile_cubit/profile_cubit.dart';

import '../../view_model/authorize_cubit/authorize_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AuthorizeCubit()),
        BlocProvider(create: (BuildContext context) => HomeCubit()..getProducts()),
        BlocProvider(create: (BuildContext context) => ProfileCubit()..getCurrentUser()),
      ],
      child: MaterialApp(
        title: 'La Vie',
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
