import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class KoyarButton extends StatelessWidget {
  const KoyarButton(
      {super.key, required this.onPressed, required this.buttonText});
  final void Function()? onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.appBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          style: getPlusJakartaSans(
            textColor: Colors.white,
            fontweight: FontWeight.w500,
            fontsize: 16,
          ),
        ),
      ),
    );
  }
}
