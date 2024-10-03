import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/common/appButton.dart';
import 'package:koyar/presentation/common/bottomModals.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';
import 'package:koyar/presentation/manager/stringManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

import '../../../../common/customTextField.dart';

class NINPage extends StatelessWidget {
  const NINPage({super.key});

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
                      label: '"Enter your National Identification Number',
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                        ),
                        child: Text(
                          'YOUR NIN?',
                          textAlign: TextAlign.center,
                          style: getBlackZodiak(
                            fontsize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Semantics(
                    textField: true,
                    label: "National Identification Number, 11-digit format",
                    child: const CustomTextField(hintText: '0000-0000-000', keyboardType: TextInputType.number,),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Semantics(
                label: "See why ${StringManager.appName} needs your NIN?",
                button: true,
                child: Text.rich(
                  TextSpan(
                    text: "Why does ${StringManager.appName} need my NIN?",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return const InquiryModalSheet(
                              answer: StringManager.whyWeNeedYourNINAnswer,
                              question: StringManager.whyWeNeedYourNINqueston,
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
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Semantics(
                label: "Next, submit your NIN",
                button: true,
                child: KoyarButton(
                  onPressed: () {
                    context.go(BaseRouteName.stateOfOriginPage);
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
