class FacebookModel{
  String? email;
  String? name;
  String? id;
  Picture? picture;

  FacebookModel({this.email, this.name, this.id, this.picture});

  FacebookModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    id = json['id'];
    picture = json['picture'] != null ? Picture.fromJson(json['picture']['data']) : null;
  }
}
class Picture{
  String? url;

  Picture({this.url});

  Picture.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}