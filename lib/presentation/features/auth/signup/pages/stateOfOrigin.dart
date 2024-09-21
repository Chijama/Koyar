
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                        horizontal: 60,
                      ),
                      child: Text(
                        'STATE OF ORGIN?',
                        textAlign: TextAlign.center,
                        style: getBlackZodiak(
                          textColor: AppColors.appBlack,
                          fontsize: 36,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: AppColors.appBlack,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    textAlign: TextAlign.center,
                    style: getPlusJakartaSans(
                      textColor: AppColors.appBlack.withOpacity(0.5),
                      fontsize: 16,
                      fontweight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'State of origin',
                      hintStyle: getPlusJakartaSans(
                        textColor: AppColors.appBlack.withOpacity(0.5),
                        fontsize: 16,
                        fontweight: FontWeight.w600,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Text.rich(
                TextSpan(
                  text: "Why does Koyar need my state of origin?",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return   const InquiryModalSheet(
                              answer: StringManager
                                  .whyWeNeedYourStateOfOriginanswer,
                              question: StringManager
                                  .whyWeNeedYourStateOfOriginquestion,
                            ) ;
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
              const SizedBox(
                height: 30,
              ),
              KoyarButton(
                onPressed: () {
                  context.go(BaseRouteName.lgaPage);
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
}
