import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/presenation/resources/theme_manager.dart';
import 'package:la_vie/presenation/screens/authorize/cubit/authorize_cubit.dart';
import 'package:la_vie/presenation/screens/home/cubit/home_cubit.dart';
import 'package:la_vie/presenation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:la_vie/app/bloc_observer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AuthorizeCubit()),
        BlocProvider(create: (BuildContext context) => HomeCubit()..getPlants()),
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
