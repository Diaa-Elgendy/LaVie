class BlogsModel {
  String? type;
  String? message;
  BlogsData? data;

  BlogsModel({this.type, this.message, this.data});

  BlogsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? BlogsData.fromJson(json['data']) : null;
  }

}

class BlogsData {
  List<BlogsPlants>? plants;
  List<BlogsSeeds>? seeds;
  List<BlogsTools>? tools;

  BlogsData({this.plants, this.seeds, this.tools});

  BlogsData.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <BlogsPlants>[];
      json['plants'].forEach((v) {
        plants!.add(BlogsPlants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = <BlogsSeeds>[];
      json['seeds'].forEach((v) {
        seeds!.add(BlogsSeeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = <BlogsTools>[];
      json['tools'].forEach((v) {
        tools!.add(BlogsTools.fromJson(v));
      });
    }
  }

}

class BlogsPlants {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  BlogsPlants(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  BlogsPlants.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

}

class BlogsSeeds {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  BlogsSeeds({this.seedId, this.name, this.description, this.imageUrl});

  BlogsSeeds.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}

class BlogsTools {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  BlogsTools({this.toolId, this.name, this.description, this.imageUrl});

  BlogsTools.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}
