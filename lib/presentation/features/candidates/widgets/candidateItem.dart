import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/candidates/widgets/profileImageOverlay.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';

class CandidateItem extends StatelessWidget {
  final bool selected;
  final bool selectionMode;
  final void Function() onTap;
  final CandidateModel candidateData;

  const CandidateItem({
    super.key,
    required this.selected,
    required this.selectionMode,
    required this.onTap,
    required this.candidateData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.push(BaseRouteName.candidatesDetailsPage,
                extra: candidateData);
          },
          child: ProfileImageOverlay(
            imagePath: candidateData.headshots,
            name: candidateData.candidate,
            title: candidateData.candidateInfo.qualification,
          ),
        ),
        if (selectionMode)
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? AppColors.appLinkBlue : AppColors.appWhite,
                  border: Border.all(color: Colors.black),
                ),
                child: selected
                    ? Icon(Icons.check, color: AppColors.appWhite, size: 18)
                    : null,
              ),
            ),
          ),
      ],
    );
  }
}
