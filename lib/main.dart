import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/app/app.dart';
import 'package:la_vie/app/bloc_observer.dart';
import 'package:la_vie/domain/remote/dio_helper.dart';
import 'package:la_vie/presenation/resources/theme_manager.dart';
import 'package:la_vie/presenation/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  runApp(const MyApp());
}



