import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

import '../manager/assetManager.dart';

class InquiryModalSheet extends StatelessWidget {
  const InquiryModalSheet({
    super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
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
          children: [
            Center(
              child: SvgPicture.asset(SvgAssetManager.manginifyingGlass),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                question,
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
              answer,
              textAlign: TextAlign.center,
              style: getPlusJakartaSans(
                textColor: AppColors.appWhite,
                fontweight: FontWeight.w400,
                fontsize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
