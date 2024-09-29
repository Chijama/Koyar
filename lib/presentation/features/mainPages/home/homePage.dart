import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koyar/presentation/manager/assetManager.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int daysTillNextElection = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MergeSemantics(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$daysTillNextElection\nDays",
                    semanticsLabel: "$daysTillNextElection Days Countdown",
                    style: getBlackZodiak(
                        fontweight: FontWeight.w500, fontsize: 76),
                  ),
                  Text(
                    "To Your Next Election",
                    style: getPlusJakartaSans(
                        textColor: AppColors.appSecondaryTextMediumGray,
                        fontsize: 20,
                        fontweight: FontWeight.w500),
                    semanticsLabel: "To Your Next Election",
                  )
                ],
              ),
            ),
            const Column(
              children: [
                Row(
                  children: [
                    HomePageItem(
                      label: "Election Dates",
                      asset: SvgAssetManager.electionDates,
                    ),
                    SizedBox(width: 15),
                    HomePageItem(
                      label: "Voting guides",
                      asset: SvgAssetManager.votersGuide,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    HomePageItem(
                      label: "Polling Unit Locator",
                      asset: SvgAssetManager.map,
                    ),
                    SizedBox(width: 15),
                    HomePageItem(
                      label: "Voter Registration Check",
                      asset: SvgAssetManager.userCheck,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class HomePageItem extends StatelessWidget {
  const HomePageItem({
    super.key,
    required this.label,
    required this.asset,
  });
  final String label;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 140,
        // width: 164,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
              color: HexColor.toHexColor('#000000').withOpacity(0.2)),
          color: AppColors.applightGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(asset),
            const SizedBox(height: 10),
            Text(
              label,
              style: getBlackZodiak(fontsize: 15, fontweight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
