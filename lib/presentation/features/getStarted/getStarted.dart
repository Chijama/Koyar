import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/manager/routeManager.dart';
import 'package:koyar/presentation/manager/stringManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

import '../../common/appButton.dart';
import '../../manager/assetManager.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Semantics(
              image: true,
              label: " ${StringManager.appName} logo",
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        PngAssetManager.appLogo,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 20,
                top: 100,
              ),
              child: Semantics(  
                label: StringManager.getStartedString,
                child: Text(
                  StringManager.getStartedString,
                  textAlign: TextAlign.center,
                  style: getNormalZodiak(
                    textColor: Colors.black,
                    fontsize: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Semantics(
                button: true,
                label: "Get Started Button",
                child: KoyarButton(
                  buttonText: 'Get Started',
                  onPressed: () {
                    context.go(BaseRouteName.ninPage);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
