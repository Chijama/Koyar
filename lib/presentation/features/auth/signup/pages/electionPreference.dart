import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/appButton.dart';
import '../../../../manager/colorManager.dart';
import '../../../../manager/routeManager.dart';
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
