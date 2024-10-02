import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CandidateComparisonPage extends StatelessWidget {
  const CandidateComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? dropDownValue = 'Buhar';
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Compare Candidates',
          semanticsLabel: 'Candidates Comparision page'),
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
              _buildSection('Personal Information', [
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
              _buildSection('Deputy Information', [[]]),
              _buildSection('Political Party', [[]]),
              _buildSection('Profile Overview', [[]]),
              _buildSection('Achievements', [[]]),
              _buildSection('Expected Policies', [[]]),
              _buildSection('Notable Fact', [[]]),
              _buildSection('Useful links', [[]]),
              _buildSection('Political Ideology', [
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

  DropdownMenuItem<String> rightDropdownMenuItem(String candidate) {
    return DropdownMenuItem(
      child: Text(
        candidate,
        style: getBlackZodiak(fontsize: 12, fontweight: FontWeight.w500),
      ),
    );
  }

  DropdownMenuItem<String> leftDropdownMenuItem(String candidate) {
    return DropdownMenuItem(
      child: Text(
        candidate,
        style: getBlackZodiak(fontsize: 12, fontweight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSection(String title, List<List<String?>> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getBlackZodiak(fontsize: 20, fontweight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Divider(
          color: AppColors.appDividerLineLightGray,
        ),
        ...rows
            .map((row) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(row[0] ?? 'nil',
                            style: getPlusJakartaSans(
                                textColor: AppColors.appSecondaryTextMediumGray,
                                fontsize: 12,
                                fontweight: FontWeight.w400)),
                      ),
                      Expanded(
                        child: Text(row[1] ?? 'nil',
                            style: getPlusJakartaSans(
                                textColor: AppColors.appSecondaryTextMediumGray,
                                fontsize: 12,
                                fontweight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ))
            ,
      ],
    );
  }
}
