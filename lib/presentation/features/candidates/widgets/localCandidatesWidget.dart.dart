import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class LocalCandidatesWidget extends StatefulWidget {
  const LocalCandidatesWidget({
    super.key,
    required List<bool> selectedCandidates,
    required bool selectionMode,
  })  : _selectedCandidates = selectedCandidates,
        _selectionMode = selectionMode;

  final List<bool> _selectedCandidates;
  final bool _selectionMode;

  @override
  State<LocalCandidatesWidget> createState() => _LocalCandidatesWidgetState();
}

class _LocalCandidatesWidgetState extends State<LocalCandidatesWidget> {
  String categoryItemSelected = '';
  List<String> categoryItemList = ['Chairmanship', 'Councillorship'];
  String stateValue = '';
  List<String> stateLga = [];
  String stateItemSelected = 'Ondo';
  @override
  Widget build(BuildContext context) {
  String lgaItemSelected = stateLga[0];

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
                  itemSelected: lgaItemSelected,
                  itemsList: NigerianStatesAndLGA.allStates,
                  onChanged: (val) {
                    stateLga.addAll(NigerianStatesAndLGA.getStateLGAs(val!));
                    setState(() {
                      stateValue = val;
                    });
                  }),
              Filterwidget(
                text: 'LGA',
                itemSelected: stateItemSelected,
                itemsList: stateLga,
              ),
            ],
          ),
        ),
        GridView.builder(
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
                    Container(
                      color: Colors.black,
                    ),
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
      ],
    );
  }
}

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comparison')),
      body: const Center(child: Text('Comparison Page')),
    );
  }
}
