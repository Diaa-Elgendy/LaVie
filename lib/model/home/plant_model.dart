// class PlantModel {
//   String? type;
//   String? message;
//   List<PlantData>? data;
//
//   PlantModel({this.type, this.message, this.data});
//
//   PlantModel.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <PlantData>[];
//       json['data'].forEach((v) {
//         data!.add(PlantData.fromJson(v));
//       });
//     }
//   }
//
// }
//
// class PlantData {
//   String? plantId;
//   String? name;
//   String? description;
//   String? imageUrl;
//   int? waterCapacity;
//   int? sunLight;
//   int? temperature;
//
//   PlantData(
//       {this.plantId,
//         this.name,
//         this.description,
//         this.imageUrl,
//         this.waterCapacity,
//         this.sunLight,
//         this.temperature});
//
//   PlantData.fromJson(Map<String, dynamic> json) {
//     plantId = json['plantId'];
//     name = json['name'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//     waterCapacity = json['waterCapacity'];
//     sunLight = json['sunLight'];
//     temperature = json['temperature'];
//   }
//
// }
