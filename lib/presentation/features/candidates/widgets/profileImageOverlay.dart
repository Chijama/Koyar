import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class ProfileImageOverlay extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? title;

  const ProfileImageOverlay({
    super.key,
    required this.imagePath,
    required this.name ,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust as needed
      height: 400, // Adjust as needed
      decoration: BoxDecoration(
        color: Colors.purple,
        image: DecorationImage(
          image: Image.network(imagePath??"").image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: IntrinsicHeight(
                  child: Container(
                    // height: 70,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    color: Colors.white.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name?? "Jane Doe",overflow: TextOverflow.ellipsis,
                            style: getNormalZodiak(
                                textColor: AppColors.appWhite,
                                fontsize: 14,
                                fontweight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text(title ?? "",overflow: TextOverflow.ellipsis,
                            style: getPlusJakartaSans(
                                textColor: AppColors.appWhite,
                                fontsize: 10,
                                fontweight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
