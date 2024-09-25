import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/common/appButton.dart';
import 'package:koyar/presentation/common/customTextField.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class PollingUnitLocatorPage extends StatelessWidget {
  const PollingUnitLocatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> countriesList = [
      'Pakistan',
      'Afghanistan',
      'America',
      'China',
      'Indonesia'
    ];
    String itemSelected = '';
    return Scaffold(
      appBar: const CustomAppBar(title: 'Voter Registeration check'),
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: MergeSemantics(
            child: Column(
              children: [
                CustomDropDownSearch(
                  itemSelected: itemSelected,
                  hintText: "Select  State",
                  searchHintText: "Search State",
                  label: 'State of Registration',
                  items: (f, cs) => countriesList,
                ),
                CustomDropDownSearch(
                  itemSelected: itemSelected,
                  hintText: "Select Local Government",
                  searchHintText: "Search Local Government",
                  label: 'Local Government of Registration',
                  items: (f, cs) => countriesList,
                ),
                CustomDropDownSearch(
                  itemSelected: itemSelected,
                  hintText: "Select Registration Area",
                  searchHintText: "Search Registration Area",
                  label: 'Registration Area',
                  items: (f, cs) => countriesList,
                ),
                CustomDropDownSearch(
                  itemSelected: itemSelected,
                  hintText: "Select Polling Unit",
                  searchHintText: "Search Polling Unit",
                  label: 'Polling Unit',
                  items: (f, cs) => countriesList,
                ),
                const SizedBox(height: 20),
                Text(
                  "Please note that the directions provided here are approximate. You are advised to visit the location prior to Election Day to confirm.",
                  style: getPlusJakartaSans(
                      fontsize: 12,
                      fontweight: FontWeight.w500,
                      textColor: AppColors.appSecondaryTextMediumGray),textAlign: TextAlign.start,
                ),
                const SizedBox(height: 56),
                KoyarButton(
                  buttonText: 'Get Directions',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
