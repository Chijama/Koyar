import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/common/appButton.dart';
import 'package:koyar/presentation/common/bottomModals.dart';
import 'package:koyar/presentation/common/customTextField.dart';
import 'package:koyar/presentation/features/voter%20regeriatration%20check/date_time_picker.dart';
import 'package:koyar/presentation/manager/assetManager.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class VoterRegistrationCheckPage extends StatelessWidget {
  const VoterRegistrationCheckPage({super.key});

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
              Semantics(
                  label: "Enter Last Name",
                  textField: true,
                  child: const CustomBoxTextField(
                    hintText: "Enter Last Name",
                    label: "Last Name",
                  )),
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
                      builder: (context) {
                        return const AppModalSheet(
                          content: Column(
                            children: [
                              SizedBox(height: 30),
                              SingleChildScrollView(
                                child: GombeBottomSheet(isSuccess: false),
                              )
                            ],
                          ),
                        );
                      });
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}

class GombeBottomSheet extends StatelessWidget {
  final bool isSuccess;

  const GombeBottomSheet({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSuccess
              ? Image.asset(PngAssetManager.success)
              : Image.asset(PngAssetManager.failed),
          const SizedBox(height: 40),
          Image.asset(PngAssetManager.card),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSuccess
                  ? const Color.fromARGB(255, 114, 61, 61)
                  : const Color(0xffB7F9B7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.cancel,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isSuccess
                        ? "Congratulations! Your voter's card status was successfully verified. You're all set to participate in the upcoming elections. Stay informed and make your voice heard!"
                        : "Oops! We couldn't verify your voter's card status. Please double-check your details and try again, or contact support for further assistance.",
                    style: getPlusJakartaSans(
                      fontsize: 14,
                      textColor:
                          isSuccess ? AppColors.appBlack : const Color(0xff640000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
