import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/appButton.dart';
import '../../../../manager/colorManager.dart';
import '../../../../manager/routeManager.dart';
import '../../../../manager/styleManager.dart';

class LGAscreen extends StatelessWidget {
  const LGAscreen({super.key});

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
                        horizontal: 50,
                      ),
                      child: Text(
                        "WHAT'S YOUR LGA",
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
                      hintText: 'Local Government Area',
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
              KoyarButton(
                onPressed: () {
                  context.go(BaseRouteName.electionPreferencePage);
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
