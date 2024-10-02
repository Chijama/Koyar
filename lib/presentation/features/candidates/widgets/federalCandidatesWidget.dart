import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
import 'package:koyar/presentation/features/candidates/widgets/profileImageOverlay.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';

class FederalCandidatesWidget extends StatelessWidget {
  const FederalCandidatesWidget({
    super.key,
    required List<bool> selectedCandidates,
    required bool selectionMode,
    required this.onTap,
  })  : _selectedCandidates = selectedCandidates,
        _selectionMode = selectionMode;

  final List<bool> _selectedCandidates;
  final bool _selectionMode;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    String itemSelected = 'Presidential';
    List<String> itemList = ['Presidential', 'Senatorial', 'House of Reps'];
    return Column(
      children: [
        Filterwidget(
          text: 'Category',
          itemSelected: itemSelected,
          itemsList: itemList,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Semantics(
                label: _selectedCandidates[index]
                    ? "Candidate ${index + 1} selected. Tap to deselect."
                    : "Candidate ${index + 1}, tap to ${_selectionMode ? 'select' : 'view profile'}.",
                child: GestureDetector(
                  onTap: () {
                    onTap(index);
                    context.push(BaseRouteName.candidatesDetailsPage);
                  },
                  child: Stack(
                    children: [
                      const ProfileImageOverlay(
                        imagePath: 'assets/profile_image.jpg',
                        name: 'James Doe',
                        title: 'VP, Product and Concierge',
                      ),
                      if (_selectionMode)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectedCandidates[index]
                                  ? AppColors.appLinkBlue
                                  : AppColors.appWhite,
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
