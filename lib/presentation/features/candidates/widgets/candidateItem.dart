import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/candidates/widgets/profileImageOverlay.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';

class CandidateItem extends StatelessWidget {
  final List<bool> selectedCandidates;
  final bool selectionMode;
  final void Function(int) onTap;
  final int index;
  final CandidateModel candidateData;

  const CandidateItem({
    Key? key,
    required this.selectedCandidates,
    required this.selectionMode,
    required this.onTap,
    required this.index,
    required this.candidateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        selectedCandidates.length > index && selectedCandidates[index];

    return Semantics(
      label: isSelected
          ? "Candidate ${candidateData.candidate} selected. Tap to deselect."
          : "Candidate ${candidateData.candidate}, tap to ${selectionMode ? 'select' : 'view profile'}.",
      child: GestureDetector(
        onTap: () {
          if (selectionMode) {
            onTap(index);
          } else {
            context.push(BaseRouteName.candidatesDetailsPage,
                extra: candidateData);
          }
        },
        child: Stack(
          children: [
            ProfileImageOverlay(
              imagePath: candidateData.headshots,
              name: candidateData.candidate,
              title: candidateData.candidateInfo.qualification,
            ),
            if (selectionMode)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isSelected ? AppColors.appLinkBlue : AppColors.appWhite,
                    border: Border.all(color: Colors.black),
                  ),
                  child: isSelected
                      ? Icon(Icons.check, color: AppColors.appWhite, size: 18)
                      : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
