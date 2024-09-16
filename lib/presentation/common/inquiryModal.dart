import 'package:flutter/widgets.dart';
import 'package:koyar/presentation/manager/colorManager.dart';

class InquiryModalSheet extends StatelessWidget {
  const InquiryModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.appBlack,
      ),
    );
  }
}
