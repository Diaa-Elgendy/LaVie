part of 'blogs_cubit.dart';

@immutable
abstract class BlogsState {}

class BlogsInitial extends BlogsState {}
class GetBlogsLoading extends BlogsState {}
class GetBlogsSuccess extends BlogsState {}
class GetBlogsFailed extends BlogsState {
  var error;

  GetBlogsFailed(this.error){
    Exceptions(error);
  }
}
