import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyar/presentation/cubit/user/user_cubit.dart';
import 'package:koyar/presentation/service/firebaseNotficationService.dart';
import 'package:koyar/presentation/common/bottomModals.dart';
import 'package:koyar/presentation/manager/routeManager.dart';
import 'package:koyar/presentation/manager/stringManager.dart';
import 'package:go_router/go_router.dart';
import '../../../common/appButton.dart';
import '../../../manager/colorManager.dart';
import '../../../manager/styleManager.dart';

class ElectionPreferencePage extends StatefulWidget {
  const ElectionPreferencePage({super.key});

  @override
  State<ElectionPreferencePage> createState() => _ElectionPreferencePageState();
}

class _ElectionPreferencePageState extends State<ElectionPreferencePage> {
  final List<String> selectedButtons = [];

  void toggleSelection(String buttonText) {
    setState(() {
      if (selectedButtons.contains(buttonText)) {
        selectedButtons.remove(buttonText);
      } else {
        selectedButtons.add(buttonText);
      }
    });
    print("Selected buttons: $selectedButtons");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Center(
                    child: Semantics(
                      label: "ELECTION PREFERENCES",
                      child: Text(
                        "ELECTION PREFERENCES",
                        textAlign: TextAlign.center,
                        style: getBlackZodiak(
                          fontsize: 36,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: KoyarHollowButton(
                          onPressed: toggleSelection,
                          buttonText: "State",
                          isSelected: selectedButtons.contains("State"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: KoyarHollowButton(
                          onPressed: toggleSelection,
                          buttonText: "Local",
                          isSelected: selectedButtons.contains("Local"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  KoyarHollowButton(
                    onPressed: toggleSelection,
                    buttonText: "Federal",
                    isSelected: selectedButtons.contains("Federal"),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              KoyarButton(
                onPressed: () {
                  // context.go(BaseRouteName.electionPreferencePage);
                  context.go(BaseRouteName.electionPreferencePage);
                  context
                      .read<UserCubit>()
                      .updateElectionPreferences(selectedButtons);
                  context.read<UserCubit>().saveUser();
                  showModalBottomSheet(
                      // enableDrag: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                     
                      isScrollControlled: true,
                      builder: (context) {
                        return InquiryModalSheet(
                          content: MergeSemantics(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                    "Allow Notifications?",
                                    textAlign: TextAlign.center,
                                    style: getNormalZodiak(
                                      textColor: AppColors.appWhite,
                                      fontsize: 18,
                                      fontweight: FontWeight.w600,
                                    ).copyWith(
                                      color: AppColors.appWhite,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  'Opt-in to get timely updates on key election dates, registration deadlines, and candidate info',
                                  textAlign: TextAlign.center,
                                  style: getPlusJakartaSans(
                                    textColor: AppColors.appWhite,
                                    fontweight: FontWeight.w400,
                                    fontsize: 12,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                _reusableText(
                                    "Registration Reminders",
                                    StringManager
                                        .allowNotificationsRegistrationReminders),
                                _reusableText(
                                    "Election Alerts",
                                    StringManager
                                        .allowNotificationsEletionAlerts),
                                _reusableText(
                                    "Candidate Updates",
                                    StringManager
                                        .allowNotificationsCandidateUpdates),
                                const SizedBox(height: 30),
                                Semantics(
                                  label: "Enable Notifications",
                                  button: true,
                                  child: KoyarButton(
                                    onPressed: () async {
                                      await FirebaseNotficationService()
                                          .initNotifications()
                                          .whenComplete(
                                        () {
                                          if (context.mounted) {
                                            context.go(BaseRouteName.home);
                                          }
                                        },
                                      );
                                    },
                                    buttonText: "Allow Notifications",
                                    buttonColor: AppColors.appWhite,
                                    textColor: AppColors.appBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                buttonText: "Next",
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _reusableText(String headerText, String subText) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            textAlign: TextAlign.start,
            style: getPlusJakartaSans(
              textColor: AppColors.appWhite,
              fontweight: FontWeight.w600,
              fontsize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subText,
            textAlign: TextAlign.start,
            style: getPlusJakartaSans(
              textColor: AppColors.appWhite,
              fontweight: FontWeight.w400,
              fontsize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// class Solution {
//   List<int> twoSum(List<int> nums, int target) {
//     List<int> answer = [];
//     for (int i = 0; i < nums.length; i++) {
//       for (int j = 0; j < nums.length; j++) {
//         if (nums[i] + nums[j] == target && i != j) {
//           answer = answer + [i, j];
//           break;
//         } 
//       }
//     }
//     return answer.f[:2];
//   }
// }
