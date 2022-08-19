// class SeedModel {
//   String? type;
//   String? message;
//   List<Seed>? data;
//
//   SeedModel({this.type, this.message, this.data});
//
//   SeedModel.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Seed>[];
//       json['data'].forEach((v) {
//         data!.add(Seed.fromJson(v));
//       });
//     }
//   }
//
// }
//
// class Seed {
//   String? seedId;
//   String? name;
//   String? description;
//   String? imageUrl;
//
//   Seed({this.seedId, this.name, this.description, this.imageUrl});
//
//   Seed.fromJson(Map<String, dynamic> json) {
//     seedId = json['seedId'];
//     name = json['name'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//   }
//
// }
