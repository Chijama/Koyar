import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/assetManager.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class Registeration extends StatelessWidget {
  final bool isSuccess;

  const Registeration({super.key, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // width: double.infinity - 20,
                child: isSuccess
                    ? Image.asset(PngAssetManager.success)
                    : Image.asset(PngAssetManager.failed),
              ),
              const SizedBox(height: 40),
              Image.asset(PngAssetManager.card),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSuccess
                      ? const Color(0xffB7F9B7)
                      : const Color(0xffFF9F9F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isSuccess ? Icons.check_circle : Icons.cancel,
                      color: isSuccess ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        isSuccess
                            ? "Congratulations! Your voter's card status was successfully verified. You're all set to participate in the upcoming elections. Stay informed and make your voice heard!"
                            : "Oops! We couldn't verify your voter's card status. Please double-check your details and try again, or contact support for further assistance.",
                        style: getPlusJakartaSans(
                          fontsize: 14,
                          textColor: isSuccess
                              ? AppColors.appBlack
                              : const Color(0xff640000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
