import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/common/customTextField.dart';

import '../../../../common/appButton.dart';
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
                      child:  Text(
                          "LOCAL GOVERNMENT OF REGISTERATION",
                          textAlign: TextAlign.center,
                          style: getBlackZodiak(
                            fontsize: 36,
                          ),semanticsLabel:"What is your Local Government of Registeration",
                          softWrap: false,
                        ),
                      ),
                    ),
                   
                  const SizedBox(
                    height: 30,
                  ),
                  Semantics(
                    button: true,
                    label: "Select Your Local Government of Registeration here",
                    // dropdown
                    child: const CustomTextField(
                      hintText: 'Local Government of Registeration',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Semantics(
                label: "Next, submit your Local Government of Registeration",
                child: KoyarButton(
                  onPressed: () {
                    context.go(BaseRouteName.electionPreferencePage);
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
