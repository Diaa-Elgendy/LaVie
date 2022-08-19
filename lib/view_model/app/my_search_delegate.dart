// import 'package:flutter/material.dart';
// import 'package:tawzef/data/dummy_models.dart';
// import 'package:tawzef/data/get_jobs_model.dart';
// import 'package:tawzef/data/login_employer_model.dart';
// import 'package:tawzef/presentation/resources/color_manager.dart';
// import 'package:tawzef/presentation/resources/components.dart';
// import 'package:tawzef/presentation/resources/font_manager.dart';
// import 'package:tawzef/presentation/resources/routes_manager.dart';
// import 'package:tawzef/presentation/resources/style_manager.dart';
// import 'package:tawzef/presentation/resources/values_manager.dart';
// import 'package:tawzef/presentation/screens/job_details/job_details_screen.dart';
//
// class MySearchDelegate extends SearchDelegate {
//   List<Jobs> searchList;
//
//   MySearchDelegate(this.searchList);
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             if (query.isEmpty) {
//               close(context, null);
//             } else {
//               query = '';
//             }
//           },
//           icon: const Icon(Icons.clear)),
//     ];
//   }
//
//   @override
//   String get searchFieldLabel => 'Search By Job Title...';
//
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return const SizedBox();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     searchList = searchList.where((element) {
//       final result = element.title!.toLowerCase();
//       final input = query.toLowerCase();
//       return result.contains(input);
//     }).toList();
//     return ListView.builder(
//       itemCount: searchList.length,
//       itemBuilder: (context, index) {
//         final suggestion = searchList[index];
//         return ListTile(
//           title: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       suggestion.title!,
//                       style: getRegularStyle(fontSize: FontSize.f16),
//                     ),
//                     Space(height: 5),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             vertical: 5,
//             horizontal: AppPadding.screenPadding,
//           ),
//           subtitle: LocationRow(
//               location: '${suggestion.country}, ${suggestion.state}'),
//           trailing: Text(
//             suggestion.companyName!,
//             style: getRegularStyle(
//                 color: ColorManager.primary, fontSize: FontSize.f12),
//           ),
//           onTap: () {
//             query = suggestion.title!;
//             navigateTo(context: context, widget: JobDetailsScreen(job: suggestion,));
//             query = '';
//           },
//         );
//       },
//     );
//   }
// }
