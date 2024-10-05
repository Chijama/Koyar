import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/candidates/widgets/candidateItem.dart';
import 'package:koyar/presentation/features/candidates/widgets/filterWidget.dart';
import 'package:koyar/presentation/service/firebaseDatabaseService.dart';

class FederalCandidatesWidget extends StatefulWidget {
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
  _FederalCandidatesWidgetState createState() =>
      _FederalCandidatesWidgetState();
}

class _FederalCandidatesWidgetState extends State<FederalCandidatesWidget> {
  late FirebaseDatabaseService _firebaseService;
  String _itemSelected = 'Presidential';

  @override
  void initState() {
    super.initState();
    _firebaseService = FirebaseDatabaseService();
  }

  Future<List<CandidateModel>> _fetchCandidates() async {
    if (_itemSelected == 'Presidential') {
      return await _firebaseService.fetchPresidentialCandidates();
    }
    // Handle other categories if needed
    return [];
  }

  @override
  Widget build(BuildContext context) {
    const List<String> itemList = [
      'Presidential',
      'Senatorial',
      'House of Reps',
    ];

    return Column(
      children: [
        FilterWidget(
          text: 'Category',
          itemSelected: _itemSelected,
          onChanged: (value) {
            setState(() {
              _itemSelected = value!;
            });
          },
          itemsList: itemList,
        ),
        Expanded(
          child: FutureBuilder<List<CandidateModel>>(
            future: _fetchCandidates(), // Fetch candidates here
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show loading indicator
              } else if (snapshot.hasError) {
                return Center(
                    child:
                        Text('Error: ${snapshot.error}')); // Show error message
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text('No candidates found.')); // No data available
              }

              // If data is available, display the grid view
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
                itemBuilder: (context, index) => CandidateItem(
                  selectedCandidates: widget.selectedCandidates,
                  selectionMode: widget.selectionMode,
                  onTap: widget.onTap,
                  index: index,
                  candidateData: candidates[index], // Pass candidate data
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
