import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/features/candidatesDetails/widgets/buildSection.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CandidatesComparisonPage extends StatelessWidget {
  const CandidatesComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? dropDownValue = 'Buhar';
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
              Row(
                children: [
                  Expanded(
                    child: Semantics(
                      label: 'Select first candidate',
                      child: DropdownButton<String>(
                        value: dropDownValue,
                        items: [
                          'Buhar',
                          'Buhari',
                          'Buharia',
                          'Buhariasi',
                          'Buhariasidu',
                        ]
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value:
                                          value, // add this property an pass the _value to it
                                      child: Text(
                                        value,
                                        style: getBlackZodiak(
                                            fontsize: 12,
                                            fontweight: FontWeight.w500),
                                      ),
                                    ))
                            .toList(),
                        onChanged: (_) {},
                        isExpanded: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Semantics(
                      label: 'Select second candidate',
                      child: DropdownButton<String>(
                        value: dropDownValue,
                        items: [
                          'Buhar',
                          'Buhari',
                          'Buharia',
                          'Buhariasi',
                          'Buhariasidu',
                        ]
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value:
                                          value, // add this property an pass the _value to it
                                      child: Text(
                                        value,
                                        style: getBlackZodiak(
                                            fontsize: 12,
                                            fontweight: FontWeight.w500),
                                      ),
                                    ))
                            .toList(),
                        onChanged: (_) {},
                        isExpanded: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 150,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const CompareSection(title: 'Personal Information', rows: [
                ['Jane Doe', 'John Smith'],
                ['45', '52'],
                ['Female', 'Male'],
                ['Married', 'Single'],
                [
                  'B.Sc. Economics, MPA Public\nAdministration',
                  'B.A. Political Science, PhD\nInternational Relations'
                ],
              ]),
              const SizedBox(height: 24),
              const CompareSection(title: 'Deputy Information', rows: [
                [
                  "He had a long-standing military career before rising to the role of CSO. His career involved serving in various capacities in the Nigerian Army, including intelligence and surveillance roles, where he earned a reputation for his loyalty to the leadership. Al-Mustapha’s career has been mired in controversy, especially related to allegations of human rights abuses during his time with the Abacha regime. Although he was acquitted of the charges in 2013",
                  "He had a long-standing military career before rising to the role of CSO. His career involved serving in various capacities in the Nigerian Army, including intelligence and surveillance roles, where he earned a reputation for his loyalty to the leadership. Al-Mustapha’s career has been mired in controversy, especially related to allegations of human rights abuses during his time with the Abacha regime. Although he was acquitted of the charges in 2013"
                ]
              ]),
              const CompareSection(title: 'Political Party', rows: [[]]),
              const CompareSection(title: 'Profile Overview', rows: [[]]),
              const CompareSection(title: 'Achievements', rows: [[]]),
              const CompareSection(title: 'Expected Policies', rows: [[]]),
              const CompareSection(title: 'Notable Fact', rows: [[]]),
              const CompareSection(title: 'Useful links', rows: [[]]),
              const CompareSection(title: 'Political Ideology', rows: [
                [
                  'Economist, Public Policy\nConsultant',
                  'Lawyer, Former UN Diplomat'
                ],
                [
                  'Progressive National Party\n(PNP)',
                  'Unity for All Party (UAP)'
                ],
                [
                  'Progressive National Party\n(PNP)',
                  'Unity for All Party (UAP)'
                ],
                ['Social Democracy', 'Centrist Liberalism'],
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
