import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/candidates/widgets/candidateItem.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
import 'package:koyar/presentation/service/firebaseDatabaseService.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class CandidatesWidget extends StatefulWidget {
  final String category;
  final List<String> selectedCandidates; // Compare by unique candidate IDs
  final bool selectionMode;
  final void Function(CandidateModel) onTap; // Return full CandidateModel

  const CandidatesWidget({
    super.key,
    required this.category,
    required this.selectedCandidates,
    required this.selectionMode,
    required this.onTap,
  });

  @override
  State<CandidatesWidget> createState() => _CandidatesWidgetState();
}

class _CandidatesWidgetState extends State<CandidatesWidget> {
  String _categorySelected = '';
  String _stateSelected = 'Ondo';
  String _lgaSelected = '';
  late List<String> categoryList;
  List<String> lgaList = [];

  @override
  void initState() {
    super.initState();
    _initializeCategories();
    if (widget.category == 'Local') {
      _updateLGAList(_stateSelected);
    }
  }

  void _initializeCategories() {
    switch (widget.category) {
      case 'Federal':
        categoryList = ['Presidential', 'Senatorial', 'House of Reps'];
        break;
      case 'State':
        categoryList = ['Gubernatorial', 'State Assembly'];
        break;
      case 'Local':
        categoryList = ['Local Government Chairman', 'Councilor'];
        break;
      default:
        categoryList = [];
    }
    _categorySelected = categoryList.isNotEmpty ? categoryList[0] : '';
  }

  void _updateLGAList(String state) {
    setState(() {
      lgaList = NigerianStatesAndLGA.getStateLGAs(state);
      _lgaSelected = lgaList.isNotEmpty ? lgaList[0] : '';
    });
  }

  Future<List<CandidateModel>> _fetchCandidates() async {
    debugPrint(_categorySelected);
    // Implement the logic to fetch candidates based on category, state, and LGA
    switch (_categorySelected) {
      case 'Presidential':
        return FirebaseDatabaseService().fetchPresidentialCandidates();

      case 'Gubernatorial':
        return FirebaseDatabaseService().fetchGubernatorialCandidates();

      case 'State Assembly':
        return FirebaseDatabaseService().fetchHouseofAssemblyCandidates();

      case 'House of Reps':
        return FirebaseDatabaseService()
            .fetchHouseofRepresentativesCandidates();

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter widgets here
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FilterWidget(
                text: 'Category',
                itemSelected: _categorySelected,
                onChanged: (value) {
                  setState(() {
                    _categorySelected = value!;
                  });
                },
                itemsList: categoryList,
              ),
              const SizedBox(width: 15),
              if (widget.category != 'Federal')
                FilterWidget(
                  text: 'State',
                  itemSelected: _stateSelected,
                  onChanged: (value) {
                    setState(() {
                      _stateSelected = value!;
                      if (widget.category == 'Local') {
                        _updateLGAList(_stateSelected);
                      }
                    });
                  },
                  itemsList: NigerianStatesAndLGA.allStates,
                ),
              if (widget.category == 'Local') ...[
                const SizedBox(width: 15),
                FilterWidget(
                  text: 'LGA',
                  itemSelected: _lgaSelected,
                  onChanged: (value) {
                    setState(() {
                      _lgaSelected = value!;
                    });
                  },
                  itemsList: lgaList,
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<CandidateModel>>(
            future: _fetchCandidates(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No candidates found.'));
              }

              List<CandidateModel> candidates = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: candidates.length,
                itemBuilder: (context, index) {
                  CandidateModel candidate = candidates[index];
                  return CandidateItem(
                    selected: widget.selectedCandidates.contains(candidate.id),
                    selectionMode: widget.selectionMode,
                    onTap: () => widget.onTap(candidate), // Return full model
                    candidateData: candidate,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
