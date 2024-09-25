import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/common/customTextField.dart';

import '../../../../common/appButton.dart';
import '../../../../common/inquiryModal.dart';
import '../../../../manager/colorManager.dart';
import '../../../../manager/routeManager.dart';
import '../../../../manager/stringManager.dart';
import '../../../../manager/styleManager.dart';

class StateOfOriginScreen extends StatelessWidget {
  const StateOfOriginScreen({super.key});

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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Semantics(
                        label: "State of Registeration",
                        child: Text(
                          'STATE OF REGISTERATION?',
                          textAlign: TextAlign.center,
                          style: getBlackZodiak(
                            fontsize: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Semantics(
                    button: true,
                    label: "Select Your State of Registeration here",
                    // dropdown
                    child: const CustomTextField(
                      hintText: 'State of Registeration',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Semantics(
                label:
                    "See why ${StringManager.appName} needs your State Registeration?",
                button: true,
                child: Text.rich(
                  TextSpan(
                    text:
                        "Why does ${StringManager.appName} need my state of Registeration?",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return const InquiryModalSheet(
                              answer: StringManager
                                  .whyWeNeedYourStateOfOriginanswer,
                              question: StringManager
                                  .whyWeNeedYourStateOfOriginquestion,
                            );
                          },
                        );
                      },
                    style: getPlusJakartaSans(
                      textColor: AppColors.appBlack.withOpacity(0.5),
                      fontsize: 12,
                      fontweight: FontWeight.w500,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.appBlack.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Semantics(
                button: true,
                label: "Next, submit your State of Registeration",
                child: KoyarButton(
                  onPressed: () {
                    context.go(BaseRouteName.lgaPage);
                  },
                  buttonText: "Next",
                ),
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
}
