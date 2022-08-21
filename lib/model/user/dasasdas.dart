class GetForumByTitle {
  String? type;
  String? message;
  Data? data;

  GetForumByTitle({this.type, this.message, this.data});

  GetForumByTitle.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  Null? userPoints;
  List<UserNotification>? userNotification;

  Data(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.imageUrl,
        this.address,
        this.role,
        this.userPoints,
        this.userNotification});

  Data.fromJson(Map<String, dynamic> json) {
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
        userNotification!.add(new UserNotification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    data['address'] = this.address;
    data['role'] = this.role;
    data['UserPoints'] = this.userPoints;
    if (this.userNotification != null) {
      data['UserNotification'] =
          this.userNotification!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['userId'] = this.userId;
    data['imageUrl'] = this.imageUrl;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
