import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/cubit/sliverScroll/sliver_scroll_cubit.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandidateDetailsPage extends StatelessWidget {
  const CandidateDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final Map<String, dynamic> candidateData = {
      'Headshots': 'https://example.com/candidate-image.jpg',
      'candidateName': 'Jane Doechester',
      'candidateInfogender': 'Male',
      'candidateInfoage': '52',
      'candidateInfoqualification':
          'B.A. Political Science, PhD International Relations',
      'candidateInfooccupation': 'Economist, Public Policy Consultant',
      'Party': 'Progressive National Party (PNP)',
      'ProfileOverview': 'Economist, Public Policy Consultant',
      'ExpectedPolicies': 'Progressive National Party (PNP)\nSocial Democracy',
      'NoteableFacts':
          '- Served as mayor for two terms\n- Authored bestselling book on local governance',
      'UsefulLinks': [
        'https://johndoe.com',
        'https://twitter.com/johndoe',
        'https://facebook.com/johndoe'
      ],
    };

    return BlocProvider(
      create: (context) => SliverScrollCubit()..initialize(),
      child: BlocBuilder<SliverScrollCubit, SliverScrollState>(
        builder: (context, state) {
          final scrollCubit = context.read<SliverScrollCubit>();

          return Scaffold(
            backgroundColor: AppColors.appBackgroundColor,
            body: CustomScrollView(
              controller: scrollCubit.scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: scrollCubit.expandedBarHeight,
                  collapsedHeight: scrollCubit.collapsedBarHeight,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: state.isCollapsed ? true : false,
                    titlePadding: EdgeInsets.only(
                      left: 40.0,
                      right: 40,
                      bottom: state.isCollapsed ? 16.0 : 24.0,
                    ),
                    title: Text(
                      candidateData['candidateName'],
                      softWrap: true,
                      style: getNormalZodiak(
                        textColor: AppColors.appWhite,
                        fontsize: state.isCollapsed ? 20 : 56,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          candidateData['Headshots'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey,
                            child: const Center(
                                child: Text('Image not available')),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black45, Colors.transparent],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  leading: Semantics(
                    label: "Go back to the previous screen.",
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoSection('Personal Information', {
                          'Age': candidateData['candidateInfoage'],
                          'Sex': candidateData['candidateInfogender'],
                          'Qualification':
                              candidateData['candidateInfoqualification'],
                        }),
                        _buildTextSection(
                          'Political Ideology',
                          candidateData['ProfileOverview'] +
                              '\n' +
                              candidateData['ExpectedPolicies'],
                        ),
                        _buildTextSection(
                            'Notable Facts', candidateData['NoteableFacts']),
                        _buildLinksSection(
                            'Useful Links', candidateData['UsefulLinks']),
                        _buildInfoSection('Personal Information', {
                          'Age': candidateData['candidateInfoage'],
                          'Sex': candidateData['candidateInfogender'],
                          'Qualification':
                              candidateData['candidateInfoqualification'],
                        }),
                        _buildTextSection(
                          'Political Ideology',
                          candidateData['ProfileOverview'] +
                              '\n' +
                              candidateData['ExpectedPolicies'],
                        ),
                        _buildTextSection(
                            'Notable Facts', candidateData['NoteableFacts']),
                        _buildLinksSection(
                            'Useful Links', candidateData['UsefulLinks']),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

 }

Widget _buildInfoSection(String title, Map<String, dynamic> info) {
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
      ...info.entries.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '${e.key}: ${e.value}',
              style: getPlusJakartaSans(
                textColor: AppColors.appSecondaryTextMediumGray,
                fontsize: 12,
                fontweight: FontWeight.w400,
              ),
            ),
          )),
      const SizedBox(height: 16),
    ],
  );
}

Widget _buildTextSection(String title, String content) {
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
      Text(
        content,
        style: getPlusJakartaSans(
          textColor: AppColors.appSecondaryTextMediumGray,
          fontsize: 12,
          fontweight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

Widget _buildLinksSection(String title, List<dynamic> links) {
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
      ...links.map(
        (link) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text.rich(
              TextSpan(
                text: link,
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: getPlusJakartaSans(
                  textColor: AppColors.appLinkBlue,
                  fontsize: 12,
                  fontweight: FontWeight.w500,
                ).copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            )),
      ),
      const SizedBox(height: 16),
    ],
  );
}
