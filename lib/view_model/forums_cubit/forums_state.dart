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

class GetAllForumsLoading extends ForumsState {}
class GetAllForumsSuccess extends ForumsState {}
class GetAllForumsFailed extends ForumsState {
  var error;

  GetAllForumsFailed(this.error){
    Exceptions(error);
  }
}

class GetMyForumsLoading extends ForumsState {}
class GetMyForumsSuccess extends ForumsState {}
class GetMyForumsFailed extends ForumsState {
  var error;

  GetMyForumsFailed(this.error){
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
