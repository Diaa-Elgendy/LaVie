part of 'forums_cubit.dart';

@immutable
abstract class ForumsState {}

class ForumsInitial extends ForumsState {}


class GetForumByTitleLoading extends ForumsState {}
class GetForumByTitleSuccess extends ForumsState {}
class GetForumByTitleFailed extends ForumsState {
  var error;

  GetForumByTitleFailed(this.error){
    Exceptions(error);
  }
}

class GetForumsLoading extends ForumsState {}
class GetForumsSuccess extends ForumsState {}
class GetForumsFailed extends ForumsState {
  var error;

  GetForumsFailed(this.error){
    Exceptions(error);
  }
}

class CreatePostLoading extends ForumsState {}
class CreatePostSuccess extends ForumsState {}
class CreatePostFailed extends ForumsState {
  var error;

  CreatePostFailed(this.error){
    Exceptions(error);
  }
}

class ImageToBase64Loading extends ForumsState {}
class ImageToBase64Success extends ForumsState {}
class ImageToBase64Failed extends ForumsState {}
