import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/candidatesDetails/widgets/buildSection.dart';
import 'package:koyar/presentation/manager/colorManager.dart';

class CandidatesComparisonPage extends StatelessWidget {
  const CandidatesComparisonPage({
    super.key,
    required this.candidates,
  });
  final List<CandidateModel> candidates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Compare Candidates',
          semanticsLabel: 'Candidates Comparison page'),
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Expanded(
              //       child: Semantics(
              //         label: candidates[0].candidate,
              //         child: DropdownButton<String>(
              //           value: dropDownValue,
              //           items: [
              //             'Buhar',
              //             'Buhari',
              //             'Buharia',
              //             'Buhariasi',
              //             'Buhariasidu',
              //           ]
              //               .map<DropdownMenuItem<String>>(
              //                   (String value) => DropdownMenuItem<String>(
              //                         value:
              //                             value, // add this property an pass the _value to it
              //                         child: Text(
              //                           value,
              //                           style: getBlackZodiak(
              //                               fontsize: 12,
              //                               fontweight: FontWeight.w500),
              //                         ),
              //                       ))
              //               .toList(),
              //           onChanged: null,
              //           iconDisabledColor: Colors.grey,
              //           isExpanded: true,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 16),
              //     Expanded(
              //       child: Semantics(
              //         label: candidates[0].candidate,
              //         child: DropdownButton<String>(
              //           value: dropDownValue,
              //           items: [
              //             'Buhar',
              //             'Buhari',
              //             'Buharia',
              //             'Buhariasi',
              //             'Buhariasidu',
              //           ]
              //               .map<DropdownMenuItem<String>>(
              //                   (String value) => DropdownMenuItem<String>(
              //                         value:
              //                             value, // add this property an pass the _value to it
              //                         child: Text(
              //                           value,
              //                           style: getBlackZodiak(
              //                               fontsize: 12,
              //                               fontweight: FontWeight.w500),
              //                         ),
              //                       ))
              //               .toList(),
              //           onChanged: null,
              //           isExpanded: true,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Image.network(
                        candidates[0].headshots,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          child:
                              const Center(child: Text('Image not available')),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Image.network(
                        candidates[1].headshots,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          child:
                              const Center(child: Text('Image not available')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CompareSection(title: 'Personal Information', rows: [
                [candidates[0].candidate, candidates[1].candidate],
                [
                  candidates[0].candidateInfo.age.toString(),
                  candidates[1].candidateInfo.age.toString()
                ],
                [
                  candidates[0].candidateInfo.gender,
                  candidates[1].candidateInfo.gender
                ],
                [
                  candidates[0].candidateInfo.occupation,
                  candidates[1].candidateInfo.occupation
                ],
                [
                  candidates[0].candidateInfo.qualification,
                  candidates[1].candidateInfo.qualification,
                ],
              ]),
              CompareSection(title: 'Deputy Information', rows: [
                [candidates[0].deputyInfo.name, candidates[1].deputyInfo.name],
                [
                  candidates[0].deputyInfo.age.toString(),
                  candidates[1].deputyInfo.age.toString()
                ],
                [
                  candidates[0].deputyInfo.gender,
                  candidates[1].deputyInfo.gender
                ],
                [
                  candidates[0].deputyInfo.qualification,
                  candidates[1].deputyInfo.qualification,
                ],
              ]),
              CompareSection(title: 'Political Party', rows: [
                [candidates[0].party, candidates[1].party]
              ]),
              CompareSection(title: 'Profile Overview', rows: [
                [candidates[0].profileOverview, candidates[1].profileOverview]
              ]),
              CompareSection(title: 'Expected Policies', rows: [
                [candidates[0].expectedPolicies, candidates[1].expectedPolicies]
              ]),
              CompareSection(title: 'Notable Fact', rows: [
                [candidates[0].noteableFacts, candidates[1].noteableFacts]
              ]),
              CompareSection(title: 'Useful links', rows: [
                [candidates[0].usefulLinks, candidates[1].usefulLinks]
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
