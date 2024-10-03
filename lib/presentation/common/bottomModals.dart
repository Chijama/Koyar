import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

import '../manager/assetManager.dart';

class InquiryModalSheet extends StatelessWidget {
  const InquiryModalSheet({
    super.key,
    this.question,
    this.answer,
    this.content,
  });

  final String? question;
  final String? answer;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Wrap(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 48,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.appGreen,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SvgPicture.asset(SvgAssetManager.manginifyingGlass),
                ),
                const SizedBox(
                  height: 20,
                ),
                content != null
                    ? content!
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              question ?? "",
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
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            answer ?? "",
                            textAlign: TextAlign.center,
                            style: getPlusJakartaSans(
                              textColor: AppColors.appWhite,
                              fontweight: FontWeight.w400,
                              fontsize: 12,
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ).animate().slideY(begin: 1.0, end: 0.0, duration: 500.milliseconds),
        ],
      ),
    );
  }
}

class AppModalSheet extends StatelessWidget {
  const AppModalSheet({
    super.key,
    required this.content,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          // margin: const EdgeInsets.symmetric(
          //   horizontal: 20,
          //   vertical: 20,
          // ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(30), topEnd: Radius.circular(30)),
            color: AppColors.appWhite,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  // margin: const EdgeInsets.only(
                  //   top: 16,
                  // ),
                  height: 6,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: AppColors.appDividerLineLightGray),
                ),
              ),
              content
            ],
          ),
        ).animate().slideY(begin: 1.0, end: 0.0, duration: 500.milliseconds),
      ],
    );
  }
}
