import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/common/appButton.dart';
import 'package:koyar/presentation/common/customTextField.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:url_launcher/url_launcher.dart';

class PollingUnitLocatorPage extends StatefulWidget {
  const PollingUnitLocatorPage({super.key});

  @override
  State<PollingUnitLocatorPage> createState() => _PollingUnitLocatorPageState();
}

class _PollingUnitLocatorPageState extends State<PollingUnitLocatorPage> {
  String stateSelected = 'Ondo';
  String lgaSelected = 'Ondo West';
  String pollingUnitSelected = '';

  @override
  Widget build(BuildContext context) {
    List<List<String>> pollingUnits = [
      ["ST PHILIP, IKONJA", "https://www.google.com/maps?q=7.0348,4.8746&mra=pd&t=m&z=3"],
      ["L.A SCH, ARAROMI", "https://www.google.com/maps?q=7.0164,4.8987&mra=pd&t=m&z=3"],
      ["ST AUGUSTINE SCH, MOJOLU", "https://www.google.com/maps?q=7.07,4.9115&mra=pd&t=m&z=3"],
      ["ST FRANCIS PRY SCH, LEKERE", "https://www.google.com/maps?q=7.0648,4.9309&mra=pd&t=m&z=3"],
      ["ST PAULS A/C SCH, LOSAN", "https://www.google.com/maps?q=7.0362,4.9678&mra=pd&t=m&z=3"],
      ["OPEN SPACE AT IGBOKUTA", "https://www.google.com/maps?q=7.0513,4.9668&mra=pd&t=m&z=3"],
      ["ST PETERS SCH, ABUSORO I", "https://www.google.com/maps?q=7.0283,4.9342&mra=pd&t=m&z=3"],
      ["ST PETERS SCH, ABUSORO II", "https://www.google.com/maps?q=7.031,4.9345&mra=pd&t=m&z=3"],
      ["OPEN SPACE AT OKELEBI, OKELEBI", "https://www.google.com/maps/place/7%C2%B001'48.4%22N+4%C2%B056'20.4%22E/@7.0301,4.9364251,17z/data=!3m1!4b1!4m4!3m3!8m2!3d7.0301!4d4.939?entry=ttu&g_ep=EgoyMDI0MDkyMy4wIKXMDSoASAFQAw%3D%3D"],
      ["OPEN SPACE AT IGBOSE", "https://www.google.com/maps?q=7.0366,4.9176&mra=pd&t=m&z=3"],
      ["OPEN SPACE AT KAJOLA", "https://www.google.com/maps?q=7.0256,4.9652&mra=pd&t=m&z=3"],
      ["OPEN SPACE AT ORISUNMIBARE", "https://www.google.com/maps/place/7%C2%B002'41.6%22N+4%C2%B057'07.6%22E/@7.0449,4.9495251,17z/data=!3m1!4b1!4m4!3m3!8m2!3d7.0449!4d4.9521?entry=ttu&g_ep=EgoyMDI0MDkyMy4wIKXMDSoASAFQAw%3D%3D"],
      ["OLANIYAN CAMP AT OLA LEKERE", "https://www.google.com/maps/place/7%C2%B005'42.2%22N+4%C2%B049'52.4%22E/@7.0950532,4.8286579,17z/data=!3m1!4b1!4m4!3m3!8m2!3d7.0950532!4d4.8312328?entry=ttu&g_ep=EgoyMDI0MDkyMy4wIKXMDSoASAFQAw%3D%3D"]
    ];

    Map<String, String> pollingUnitMap = {
      for (var unit in pollingUnits) unit[0]: unit[1]
    };

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Polling Unit Check',
        semanticsLabel: "Check your polling unit location",
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: MergeSemantics(
              child: Column(
                children: [
                  Semantics(
                    label: 'State of registration dropdown',
                    child: CustomDropDownSearch(
                      itemSelected: stateSelected,
                      hintText: "Select State",
                      searchHintText: "Search State",
                      label: 'State of Registration',
                      items: (f, cs) => NigerianStatesAndLGA.allStates,
                      onChanged: (value) {
                        setState(() {
                          stateSelected = value!;
                        });
                      },
                    ),
                  ),
                  Semantics(
                    label: 'Local government of registration dropdown',
                    child: CustomDropDownSearch(
                      itemSelected: lgaSelected,
                      hintText: "Select Local Government",
                      searchHintText: "Search Local Government",
                      label: 'Local Government of Registration',
                      items: (f, cs) => NigerianStatesAndLGA.ondoLGAs,
                      onChanged: (value) {
                        setState(() {
                          lgaSelected = value!;
                        });
                      },
                    ),
                  ),
                  Semantics(
                    label: 'Polling unit dropdown',
                    child: CustomDropDownSearch(
                      itemSelected: pollingUnitSelected,
                      hintText: "Select Polling Unit",
                      searchHintText: "Search Polling Unit",
                      label: 'Polling Unit',
                      onChanged: (value) {
                        setState(() {
                          pollingUnitSelected = value!;
                        });
                      },
                      items: (f, cs) => pollingUnitMap.keys.toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Semantics(
                    label: "Important notice about polling unit directions",
                    child: Text(
                      "Please note that the directions provided here are approximate. You are advised to visit the location prior to Election Day to confirm.",
                      style: getPlusJakartaSans(
                          fontsize: 12,
                          fontweight: FontWeight.w500,
                          textColor: AppColors.appSecondaryTextMediumGray),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 56),
                  Semantics(
                    label: "Get directions to polling unit button",
                    button: true,
                    child: KoyarButton(
                      buttonText: 'Get Directions',
                      onPressed: () async {
                        if (pollingUnitSelected.isNotEmpty) {
                          final url = pollingUnitMap[pollingUnitSelected]!;
                          debugPrint("Selected Polling Unit: $pollingUnitSelected");
                          debugPrint("URL: $url");
                          final Uri url0 = Uri.parse(url);

                          if (await canLaunchUrl(url0)) {
                            await launchUrl(url0);
                          } else {
                            throw 'Could not launch $url';
                          }
                        } else {
                          debugPrint("No polling unit selected");
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
