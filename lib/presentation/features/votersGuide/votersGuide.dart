import "package:flutter/material.dart";
import "package:koyar/presentation/common/appBar.dart";
import "package:koyar/presentation/manager/colorManager.dart";
import "package:koyar/presentation/manager/styleManager.dart";

class VotingGuidesScreen extends StatelessWidget {
  const VotingGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Expanded(
              child: TabBarView(
                children: [
                  NewVoterGuide(),
                  ReturningVoterGuide(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewVoterGuide extends StatelessWidget {
  const NewVoterGuide({super.key});

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
      itemBuilder: (context, index) {
        return   VotersGuideWidget(index: index,);
      },
      itemCount: 8,
      // const ExpansionTile(
      //     title: Text("Collect Your Permanent Voter's Card (PVC)")),
      // const ExpansionTile(title: Text("Know Your Polling Unit")),
      // const ExpansionTile(title: Text("Election Day Preparation")),
    );
  }
}
class ReturningVoterGuide extends StatelessWidget {
  const ReturningVoterGuide({super.key});

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
      itemBuilder: (context, index) {
        return   VotersGuideWidget(index: index,);
      },
      itemCount: 8,
      // const ExpansionTile(
      //     title: Text("Collect Your Permanent Voter's Card (PVC)")),
      // const ExpansionTile(title: Text("Know Your Polling Unit")),
      // const ExpansionTile(title: Text("Election Day Preparation")),
    );
  }
}
class VotersGuideWidget extends StatelessWidget {
  const VotersGuideWidget({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),
      tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      title: Text(
        "Register to Vote",
        style: getPlusJakartaSans(
            textColor: AppColors.appBlack,
            fontsize: 17,
            fontweight: FontWeight.w500),
      ),
      initiallyExpanded: index==0? true:false,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.appBlack.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: AppColors.appMainBackgroundOffWhite),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Visit the nearest INEC (Independent National Electoral Commission) office to register."),
                SizedBox(height: 8),
                Text(
                    "Ensure you bring a valid means of identification (National ID, passport, or driver's license). You will be issued a Temporary Voter's Card (TVC)."),
                SizedBox(height: 8),
                Text(
                  "Not sure how to register? Watch this step-by-step video tutorial on how to register with INEC",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class ReturningVoterGuide extends StatelessWidget {
//   const ReturningVoterGuide({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: const [
//         ExpansionTile(
//           title: Text("Ensure Your PVC is Valid and Accessible"),
//           initiallyExpanded: true,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                       "Make sure you know where your PVC is ahead of the election. If it's lost, check with INEC for replacement procedures before the election."),
//                   SizedBox(height: 8),
//                   Text(
//                     "Need help replacing a lost PVC? Watch this tutorial video for guidance.",
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         ExpansionTile(title: Text("Verify Your Polling Unit")),
//         ExpansionTile(title: Text("Know the Election Schedule")),
//         ExpansionTile(title: Text("On Election Day")),
//         ExpansionTile(title: Text("Observe Electoral Safety")),
//       ],
//     );
//   }
// }
