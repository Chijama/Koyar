import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidates/widgets/candidateItem.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class StateCandidatesWidget extends StatelessWidget {
  const StateCandidatesWidget({
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
    String categoryItemSelected = 'Governor';
    List<String> categoryItemList = ['Governor', 'House of Assembly'];

    String stateItemSelected = 'Ondo';
    return Column(
      children: [
        SizedBox(
          height: 50,
          // width: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
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
              ), // Use the new CategoryLabel widget
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
              return CandidateItem(
                    selectedCandidates:  _selectedCandidates,
                    selectionMode:  _selectionMode,
                    onTap:  onTap,
                    index: index,
                  );
            },
          ),
        ),
      ],
    );
  }
}
