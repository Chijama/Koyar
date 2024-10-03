import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidates/widgets/candidateItem.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';

class FederalCandidatesWidget extends StatelessWidget {
  final List<bool> selectedCandidates;
  final bool selectionMode;
  final void Function(int) onTap;

  const FederalCandidatesWidget({
    super.key,
    required this.selectedCandidates,
    required this.selectionMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const String itemSelected = 'Presidential';
    const List<String> itemList = [
      'Presidential',
      'Senatorial',
      'House of Reps'
    ];

    return Column(
      children: [
        const Filterwidget(
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
              itemBuilder: (context, index) => CandidateItem(
                    selectedCandidates: selectedCandidates,
                    selectionMode: selectionMode,
                    onTap: onTap,
                    index: index,
                  )),
        ),
      ],
    );
  }
}
