import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';
import 'package:koyar/presentation/service/firebaseDatabaseService.dart';
import 'package:url_launcher/url_launcher.dart';

class VotingGuidePage extends StatelessWidget {
  const VotingGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseDatabaseService dataService = FirebaseDatabaseService();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Voting Guides",
          semanticsLabel: '',
        ),
        backgroundColor: AppColors.appBackgroundColor,
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: "New Voter"),
                Tab(text: "Returning Voter"),
              ],
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.appLinkBlue,
              labelStyle: getNormalZodiak(
                  textColor: AppColors.appLinkBlue,
                  fontsize: 14,
                  fontweight: FontWeight.w500),
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.appLinkBlue,
            ),
            FutureBuilder<Map<String, dynamic>>(
                future: dataService.getVotersGuide(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error fetching data"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No data available"));
                  }
                  debugPrint("Voter's guide data ${snapshot.data}");
                  debugPrint("Voter's guide data ${snapshot.data}");
                  // Process the data from Firebase
                  final data = snapshot.data!;
                  final entries = data.entries
                      .map((e) => Map<String, dynamic>.from(e.value))
                      .toList();

                  // Separate data based on Category
                  final newVoterData = entries
                      .where((entry) => entry['Category'] == 'New Voters')
                      .toList();

                  final returningVoterData = entries
                      .where((entry) => entry['Category'] == 'Returning Voters')
                      .toList();
                  debugPrint("new Voter's guide data ${newVoterData}");
                  debugPrint(
                      "returning Voter's guide data ${returningVoterData}");

                  return Expanded(
                    child: TabBarView(
                      children: [
                        VoterGuideList(data: newVoterData),
                        VoterGuideList(data: returningVoterData),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class VoterGuideList extends StatelessWidget {
  const VoterGuideList({super.key, required this.data});

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: AppColors.appDividerLineLightGray,
          indent: 20,
          endIndent: 20,
        );
      },
      itemCount: data.length,
      itemBuilder: (context, index) {
        final guide = data[index];
        return VotersGuideWidget(
          title: guide['Title'],
          url: guide['Link'],
          content: guide['Content'],
          initiallyExpanded: index == 0,
        );
      },
    );
  }
}

class VotersGuideWidget extends StatelessWidget {
  const VotersGuideWidget({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
    required this.url,
  });

  final String title;
  final String content;
  final bool initiallyExpanded;
  final String url;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),
      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      title: Text(
        title,
        style: getPlusJakartaSans(
            textColor: AppColors.appBlack,
            fontsize: 17,
            fontweight: FontWeight.w500),
      ),
      initiallyExpanded: initiallyExpanded,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.appBlack.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: AppColors.appMainBackgroundOffWhite),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: content,
                style:
                    getBlackZodiak(fontsize: 13, fontweight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: " Click here to learn more",
                    style: getNormalZodiak(
                        textColor: AppColors.appLinkBlue,
                        fontsize: 14,
                        fontweight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri _url = Uri.parse(url);

                        if (await canLaunchUrl(_url)) {
                          await launchUrl(_url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
