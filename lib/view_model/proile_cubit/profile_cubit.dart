import 'package:bloc/bloc.dart';
import 'package:la_vie/model/user/current_user_model.dart';
import 'package:la_vie/view_model/dio_network/dio_exceptions.dart';
import 'package:la_vie/view_model/dio_network/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../view/resources/string_manager.dart';
import '../dio_network/end_points.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  CurrentUserModel? currentUserModel;

  Future getCurrentUser() async {
    emit(GetCurrentUserLoading());
    return await DioHelper.getData(
      endPoint: EndPoint.getCurrentUser,
      token: StringManager.userToken,
    ).then((value) {
      currentUserModel = CurrentUserModel.fromJson(value.data);
      emit(GetCurrentUserSuccess());
    }).catchError((error) {
      emit(GetCurrentUserFailed(error));
    });
  }

  Future updateCurrentUser(
      {required String firstName,
        required String lastName,
        required String email,
        required String address}) async {
    emit(UpdateProfileLoading());
    return await DioHelper.patchData(
      endPoint: EndPoint.updateCurrentUser,
      token: StringManager.userToken,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
      },
    ).then((value) {
      emit(UpdateProfileSuccess());
    }).catchError((error) {
      emit(UpdateProfileFailed(error));
    });
  }
}
