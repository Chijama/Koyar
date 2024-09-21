import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/inquiryModal.dart';

import '../../../../common/appButton.dart';
import '../../../../manager/colorManager.dart';
import '../../../../manager/styleManager.dart';

class ElectionPreferencePage extends StatelessWidget {
  const ElectionPreferencePage({super.key});

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
                    child: Text(
                      "ELECTION PREFERENCES",
                      textAlign: TextAlign.center,
                      style: getBlackZodiak(
                        textColor: AppColors.appBlack,
                        fontsize: 36,
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
                          onPressed: () {},
                          buttonText: "State",
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: KoyarHollowButton(
                          onPressed: () {},
                          buttonText: "Presidential",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  KoyarHollowButton(
                    onPressed: () {},
                    buttonText: "Local Government",
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              KoyarButton(
                onPressed: () {
                  // context.go(BaseRouteName.electionPreferencePage);
                  showModalBottomSheet(
                      enableDrag: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      // barrierColor: Colors.transparent,
                      builder: (context) {
                        return InquiryModalSheet(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
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
                              _reusableText("Registration Reminders"),
                              _reusableText("Election Alerts"),
                              _reusableText("Candidate Updates"),
                              _reusableText("Election News"),
                              const SizedBox(height: 40),
                              KoyarButton(
                                onPressed: () {},
                                buttonText: "Saved Preferences",
                                buttonColor: AppColors.appWhite,
                              ),
                              const SizedBox(height: 40),
                            ],
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

  Column _reusableText(String text) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: getPlusJakartaSans(
            textColor: AppColors.appWhite,
            fontweight: FontWeight.w400,
            fontsize: 12,
          ),
        ),
        const SizedBox(height: 12),
      ],
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
