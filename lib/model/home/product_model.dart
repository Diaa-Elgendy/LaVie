class ProductsModel {
  String? type;
  String? message;
  List<Product>? products;

  ProductsModel({this.type, this.message, this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

}

class Product {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  bool? available;
  Seed? seed;
  Plant? plant;
  Tool? tool;

  Product(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.type,
        this.price,
        this.available,
        this.seed,
        this.plant,
        this.tool});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = json['seed'] != null ? Seed.fromJson(json['seed']) : null;
    plant = json['plant'] != null ? Plant.fromJson(json['plant']) : null;
    tool = json['tool'] != null ? Tool.fromJson(json['tool']) : null;
  }

}

class Seed {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seed({this.seedId, this.name, this.description, this.imageUrl});

  Seed.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}

class Plant {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

}

class Tool {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tool({this.toolId, this.name, this.description, this.imageUrl});

  Tool.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}
