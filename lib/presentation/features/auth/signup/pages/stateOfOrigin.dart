import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
 import 'package:koyar/presentation/features/auth/dropDownWidget.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

import '../../../../common/appButton.dart';
import '../../../../common/bottomModals.dart';
import '../../../../manager/colorManager.dart';
import '../../../../manager/routeManager.dart';
import '../../../../manager/stringManager.dart';
import '../../../../manager/styleManager.dart';

class StateOfOriginScreen extends HookWidget {
  const StateOfOriginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stateItemSelected = useState<String>('');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200),
                  Center(
                    child: Semantics(
                      label: "State of Registration",
                      child: Text(
                        'STATE OF \nREGISTRATION?',
                        textAlign: TextAlign.center,
                        style: getBlackZodiak(fontsize: 32),
                        softWrap: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Semantics(
                    button: true,
                    label: "Select Your State of Registration here",
                    child: DropDownWidget(
                      itemSelected: stateItemSelected.value,
                      items: NigerianStatesAndLGA.allStates,
                      onChanged: (val) {
                        stateItemSelected.value = val!  ;
                      },
                      label: 'State of Registration',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Semantics(
                    label: "See why ${StringManager.appName} needs your State Registration?",
                    button: true,
                    child: Text.rich(
                      TextSpan(
                        text: "Why does ${StringManager.appName} need my state of Registration?",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => const InquiryModalSheet(
                                answer: StringManager.whyWeNeedYourStateOfOriginanswer,
                                question: StringManager.whyWeNeedYourStateOfOriginquestion,
                              ),
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
                  const SizedBox(height: 30),
                  Semantics(
                    button: true,
                    label: "Next, submit your State of Registration",
                    child: KoyarButton(
                      onPressed: () {
                        debugPrint('####selected item ${stateItemSelected.value}');
                        if (stateItemSelected.value.isNotEmpty) {
                          context.go(BaseRouteName.lgaPage, extra: stateItemSelected.value);
                        }
                      },
                      buttonText: "Next",
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}