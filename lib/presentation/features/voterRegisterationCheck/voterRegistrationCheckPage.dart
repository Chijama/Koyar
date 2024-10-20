import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/common/appButton.dart';
import 'package:koyar/presentation/common/bottomModals.dart';
import 'package:koyar/presentation/common/customTextField.dart';
import 'package:koyar/presentation/features/voterRegisterationCheck/widgets/date_time_picker.dart';
import 'package:koyar/presentation/features/voterRegisterationCheck/widgets/regeristrationFeedback.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class VoterRegistrationCheckPage extends StatefulWidget {
  const VoterRegistrationCheckPage({super.key});
  @override
  State<VoterRegistrationCheckPage> createState() =>
      _VoterRegistrationCheckPageState();
}
class _VoterRegistrationCheckPageState
    extends State<VoterRegistrationCheckPage> {
  String stateItemSelected = 'Ondo'; // Moved to the state class
  String lgastateItemSelected = 'Ondo West';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Voter Registration Check',
        semanticsLabel: "Check your voter registration status",
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomDropDownSearch(
                  itemSelected: stateItemSelected,
                  onChanged: (value) {
                    setState(() {
                      stateItemSelected = value!;
                      // Reset LGA selection when state changes
                      lgastateItemSelected = '';
                    });
                  },
                  hintText: "Select State",
                  searchHintText: "Search State",
                  label: 'State of Registration',
                  items: (f, cs) => NigerianStatesAndLGA.allStates,
                ),
                CustomDropDownSearch(
                  itemSelected: lgastateItemSelected,
                  onChanged: (value) {
                    setState(() {
                      lgastateItemSelected = value!;
                    });
                  },
                  hintText: "Select Local Government",
                  searchHintText: "Search Local Government",
                  label: 'Local Government of Registration',
                  items: (f, cs) =>
                      NigerianStatesAndLGA.getStateLGAs(stateItemSelected),
                ),
                Semantics(
                  label: "Enter Last Name",
                  textField: true,
                  child: const CustomBoxTextField(
                    hintText: "Enter Last Name",
                    label: "Last Name",
                  ),
                ),
                Semantics(
                  label: "Enter First Name",
                  textField: true,
                  child: const CustomBoxTextField(
                    hintText: "Enter First Name",
                    label: "First Name",
                  ),
                ),
                const DateTimePicker(label: 'Date of Birth'),
                const SizedBox(height: 56),
                KoyarButton(
                  buttonText: 'Check Voter Status',
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AppModalSheet(
                          content: Column(
                            children: [Registeration(isSuccess: false)],
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
