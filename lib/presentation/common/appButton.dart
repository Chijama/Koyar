import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class KoyarButton extends StatelessWidget {
  const KoyarButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.buttonColor,
      this.textColor});
  final void Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.appGreen,
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
            textColor: textColor ?? Colors.white,
            fontweight: FontWeight.w500,
            fontsize: 16,
          ),
        ),
      ),
    );
  }
}
 
class KoyarHollowButton extends StatelessWidget {
  const KoyarHollowButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.isSelected,
  });

  final void Function(String) onPressed;
  final String buttonText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.appWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: isSelected ? Colors.blue : AppColors.appGreen,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
      ),
      onPressed: () => onPressed(buttonText),
      child: Center(
        child: Text(
          buttonText,
          style: getPlusJakartaSans(
            textColor: isSelected ? Colors.blue : AppColors.appGreen,
            fontweight: FontWeight.w500,
            fontsize: 18,
          ),
        ),
      ),
    );
  }
}
// class KoyarHollowButton extends StatefulWidget {
//   const KoyarHollowButton(
//       {super.key, required this.onPressed, required this.buttonText});
//   final void Function()? onPressed;
//   final String buttonText;

//   @override
//   State<KoyarHollowButton> createState() => _KoyarHollowButtonState();
// }

// class _KoyarHollowButtonState extends State<KoyarHollowButton> {
//   @override
//   Widget build(BuildContext context) { bool
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.appWhite,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4),
//             side: BorderSide(
//               color: AppColors.appGreen,
//               width: 1,
//             )),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 10,
//           vertical: 20,
//         ),
//       ),
//       onPressed: widget.onPressed,
//       child: Center(
//         child: Text(
//           widget.buttonText,
//           style: getPlusJakartaSans(
//             textColor: AppColors.appGreen,
//             fontweight: FontWeight.w500,
//             fontsize: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }
