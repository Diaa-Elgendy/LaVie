import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/view_model/app/app.dart';
import 'package:la_vie/view_model/local_data/database/database_helper.dart';
import 'package:la_vie/view_model/local_data/shared_pref/cache_helper.dart';
import 'view_model/app/bloc_observer.dart';
import 'view_model/dio_network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

// api/v1/user/reciepts/{recieptId}