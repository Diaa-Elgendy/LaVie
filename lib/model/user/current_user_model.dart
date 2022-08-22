class CurrentUserModel {
  String? type;
  String? message;
  UserData? data;

  CurrentUserModel({this.type, this.message, this.data});

  CurrentUserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

}

class UserData {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  int? userPoints;
  List<UserNotification>? userNotification;

  UserData(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.imageUrl,
        this.address,
        this.role,
        this.userPoints = 0,
        this.userNotification});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
    if (json['UserNotification'] != null) {
      userNotification = <UserNotification>[];
      json['UserNotification'].forEach((v) {
        userNotification!.add(UserNotification.fromJson(v));
      });
    }
  }

}

class UserNotification {
  String? notificationId;
  String? userId;
  String? imageUrl;
  String? message;
  String? createdAt;

  UserNotification(
      {this.notificationId,
        this.userId,
        this.imageUrl,
        this.message,
        this.createdAt});

  UserNotification.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    userId = json['userId'];
    imageUrl = json['imageUrl'];
    message = json['message'];
    createdAt = json['createdAt'];
  }

}

