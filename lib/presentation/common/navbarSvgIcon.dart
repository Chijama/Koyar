// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../manager/colorManager.dart';
import '../manager/styleManager.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required this.svgicon,
    this.isSvgIconSelected = false,
    required this.navName,
  });

  final String svgicon;
  final bool isSvgIconSelected;
  final String navName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 2,
        ),
        SvgPicture.asset(
          svgicon,
          color: isSvgIconSelected ? Colors.black : AppColors.appTextGrey,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          navName,
          style: getPlusJakartaSans(
            textColor: AppColors.appTextGrey,
            fontweight: FontWeight.w500,
            fontsize: 12,
          ).copyWith(
            color: isSvgIconSelected ? AppColors.appBlack : null,
          ),
        )
      ],
    );
  }
}
