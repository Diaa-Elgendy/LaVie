// class ToolModel {
//   String? type;
//   String? message;
//   List<Tool>? data;
//
//   ToolModel({this.type, this.message, this.data});
//
//   ToolModel.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Tool>[];
//       json['data'].forEach((v) {
//         data!.add( Tool.fromJson(v));
//       });
//     }
//   }
//
// }
//
// class Tool {
//   String? toolId;
//   String? name;
//   String? description;
//   String? imageUrl;
//
//   Tool({this.toolId, this.name, this.description, this.imageUrl});
//
//   Tool.fromJson(Map<String, dynamic> json) {
//     toolId = json['toolId'];
//     name = json['name'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//   }
//
// }
