import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blogs_state.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogsInitial());
}
