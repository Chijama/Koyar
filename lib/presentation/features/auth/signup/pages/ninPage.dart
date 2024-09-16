
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:koyar/presentation/common/appButton.dart';
import 'package:koyar/presentation/common/inquiryModal.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                      ),
                      child: Text(
                        'YOUR NIN ?',
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
                    keyboardType: TextInputType.number,
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
                      hintText: '0000-0000-000',
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
                  text: "Why does Koyar need my NIN?",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const InquiryModalSheet();
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
                onPressed: () {},
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
