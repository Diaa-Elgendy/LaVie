import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/model/forums/all_forums_model.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:la_vie/view_model/dio_network/dio_exceptions.dart';
import 'package:la_vie/view_model/dio_network/dio_helper.dart';
import 'package:la_vie/view_model/dio_network/end_points.dart';
import 'package:meta/meta.dart';

part 'forums_state.dart';

class ForumsCubit extends Cubit<ForumsState> {
  ForumsCubit() : super(ForumsInitial());

  static ForumsCubit get(context) => BlocProvider.of(context);

  AllForumsModel forumsModel = AllForumsModel();

  AllForumsModel? forumByTitle;

  Future getForumByTitle(String title) async {
    emit(GetForumByTitleLoading());
    return await DioHelper.getData(
      endPoint: '${EndPoint.getForumByTitle}?search=$title',
      token: StringManager.userToken,
    ).then((value) {
      forumByTitle = AllForumsModel.fromJson(value.data);
      emit(GetForumByTitleSuccess());
    }).catchError((error) {
      emit(GetForumByTitleFailed(error));
    });
  }

  Future getAllForums() async {
    emit(GetAllForumsLoading());
    return await DioHelper.getData(
      endPoint: EndPoint.getAllForums,
      token: StringManager.userToken,
    ).then((value) {
      forumsModel = AllForumsModel.fromJson(value.data);
      emit(GetAllForumsSuccess());
    }).catchError((error) {
      emit(GetAllForumsFailed(error));
    });
  }

  Future getMyForums() async {
    emit(GetMyForumsLoading());
    return await DioHelper.getData(
      endPoint: EndPoint.getMyForums,
      token: StringManager.userToken,
    ).then((value) {
      forumsModel = AllForumsModel.fromJson(value.data);
      emit(GetMyForumsSuccess());
    }).catchError((error) {
      emit(GetMyForumsFailed(error));
    });
  }

  Future createNewPost(
      {required String title,
      required String description,
      required String image64,
      required context}) async {
    emit(CreatePostLoading());
    return await DioHelper.postData(
      endPoint: EndPoint.createNewPost,
      token: StringManager.userToken,
      data: {
        'title': title,
        'description': description,
        'imageBase64': image64,
      },
    ).then((value) {
      showSnackBar('Post Created', context);
      emit(CreatePostSuccess());
    }).catchError((error) {
      emit(CreatePostFailed(error));
    });
  }

  String imageToBase64(XFile image) {
    emit(ImageToBase64Loading());
    try {
      final bytes = File(image.path).readAsBytesSync();
      String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
      emit(ImageToBase64Success());
      return base64Image;
    } catch (e) {
      print(e.toString());
      emit(ImageToBase64Failed());
      return '';
    }
  }
}
