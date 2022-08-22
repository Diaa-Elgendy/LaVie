import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/blogs/blogs_model.dart';
import 'package:la_vie/view/resources/string_manager.dart';
import 'package:la_vie/view_model/dio_network/dio_exceptions.dart';
import 'package:la_vie/view_model/dio_network/dio_helper.dart';
import 'package:la_vie/view_model/dio_network/end_points.dart';
import 'package:meta/meta.dart';

part 'blogs_state.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogsInitial());

  static BlogsCubit get(context) => BlocProvider.of(context);

  BlogsModel? blogsModel;

  Future getBlogs() async {
    emit(GetBlogsLoading());
    return await DioHelper.getData(
      endPoint: EndPoint.getBlogs,
      token: StringManager.userToken,
    ).then((value) {
      blogsModel = BlogsModel.fromJson(value.data);
      emit(GetBlogsSuccess());
    }).catchError((error) {
      emit(GetBlogsFailed(error));
    });
  }
}
