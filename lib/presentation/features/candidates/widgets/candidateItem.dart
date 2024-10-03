import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/features/candidates/widgets/profileImageOverlay.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';

class CandidateItem extends StatelessWidget {
  const CandidateItem({
    super.key,
    required this.selectedCandidates,
    required this.selectionMode,
    required this.onTap,
    required this.index,
  });
  final int index;
  final List<bool> selectedCandidates;
  final bool selectionMode;
  final void Function(int p1) onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: selectedCandidates[index]
          ? "Candidate ${index + 1} selected. Tap to deselect."
          : "Candidate ${index + 1}, tap to ${selectionMode ? 'select' : 'view profile'}.",
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.push(BaseRouteName.candidatesDetailsPage);
            },
            child: const ProfileImageOverlay(
              imagePath: 'assets/profile_image.jpg',
              name: 'James Doe',
              title: 'VP, Product and Concierge',
            ),
          ),
          if (selectionMode)
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedCandidates[index]
                        ? AppColors.appLinkBlue
                        : AppColors.appWhite,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
