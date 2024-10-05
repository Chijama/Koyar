// import 'package:flutter/material.dart';
// import 'package:koyar/presentation/features/candidates/widgets/candidateItem.dart';
// import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
// import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

// class LocalCandidatesWidget extends StatefulWidget {
//   const LocalCandidatesWidget({
//     super.key,
//     required List<bool> selectedCandidates,
//     required bool selectionMode,
//     required this.onTap,
//   })  : _selectedCandidates = selectedCandidates,
//         _selectionMode = selectionMode;

//   final List<bool> _selectedCandidates;
//   final bool _selectionMode;
//   final void Function(int) onTap;

//   @override
//   State<LocalCandidatesWidget> createState() => _LocalCandidatesWidgetState();
// }

// class _LocalCandidatesWidgetState extends State<LocalCandidatesWidget> {
//   @override
//   Widget build(BuildContext context) {
//     String categoryItemSelected = '';

//     List<String> categoryItemList = ['Chairmanship', 'Councillorship'];

//     List<String> stateLga = [];
//     String lgaItemSelected = stateLga[0];

//     String stateItemSelected = 'Ondo';
//     return Column(
//       children: [
//         SizedBox(
//           height: 50,
//           // width: 100,
//           child: Row(
//             children: [
//               FilterWidget(
//                 text: 'Category',
//                 itemSelected: categoryItemSelected,
//                 itemsList: categoryItemList,
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               FilterWidget(
//                   text: 'State',
//                   itemSelected: stateItemSelected,
//                   itemsList: NigerianStatesAndLGA.allStates,
//                   onChanged: (val) {
//                     setState(() {
//                       stateLga.addAll(NigerianStatesAndLGA.getStateLGAs(val!));
//                     });
//                   }),
//               FilterWidget(
//                 text: 'LGA',
//                 itemSelected: lgaItemSelected,
//                 itemsList: stateLga,
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: GridView.builder(
//             padding: const EdgeInsets.all(8),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.75,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//             ),
//             itemCount: 6,
//             itemBuilder: (context, index) {
//               return CandidateItem(
//                 selectedCandidates: widget._selectedCandidates,
//                 selectionMode: widget._selectionMode,
//                 onTap: widget.onTap,
//                 index: index,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
