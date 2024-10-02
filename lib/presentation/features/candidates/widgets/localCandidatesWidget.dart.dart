import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
import 'package:koyar/presentation/features/candidates/widgets/profileImageOverlay.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class LocalCandidatesWidget extends StatefulWidget {
  const LocalCandidatesWidget({
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
  State<LocalCandidatesWidget> createState() => _LocalCandidatesWidgetState();
}

class _LocalCandidatesWidgetState extends State<LocalCandidatesWidget> {
  @override
  Widget build(BuildContext context) {
    String categoryItemSelected = '';

    List<String> categoryItemList = ['Chairmanship', 'Councillorship'];

    List<String> stateLga = [];
    String lgaItemSelected = stateLga[0];

    String stateItemSelected = 'Ondo';
    return Column(
      children: [
        SizedBox(
          height: 50,
          // width: 100,
          child: Row(
            children: [
              Filterwidget(
                text: 'Category',
                itemSelected: categoryItemSelected,
                itemsList: categoryItemList,
              ),
              const SizedBox(
                width: 15,
              ),
              Filterwidget(
                  text: 'State',
                  itemSelected: stateItemSelected,
                  itemsList: NigerianStatesAndLGA.allStates,
                  onChanged: (val) {
                    setState(() {
                    stateLga.addAll(NigerianStatesAndLGA.getStateLGAs(val!));
                    });
                  }),
              Filterwidget(
                text: 'LGA',
                itemSelected: lgaItemSelected,
                itemsList: stateLga,
              ),
            ],
          ),
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
                label: widget._selectedCandidates[index]
                    ? "Candidate ${index + 1} selected. Tap to deselect."
                    : "Candidate ${index + 1}, tap to ${widget._selectionMode ? 'select' : 'view profile'}.",
                child: GestureDetector(
                  // onTap: () => _toggleCandidate(index),
                  child: Stack(
                    children: [
                      const ProfileImageOverlay(
                          imagePath: 'imagePath', name: 'name', title: 'title'),
                      if (widget._selectionMode)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget._selectedCandidates[index]
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
