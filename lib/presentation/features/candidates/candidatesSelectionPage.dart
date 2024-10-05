import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/common/customTextField.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/candidates/widgets/candidatesWidget.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CandidateSelectionPage extends StatefulWidget {
  const CandidateSelectionPage({Key? key}) : super(key: key);

  @override
  State<CandidateSelectionPage> createState() => _CandidateSelectionPageState();
}

class _CandidateSelectionPageState extends State<CandidateSelectionPage>
    with SingleTickerProviderStateMixin {
  bool _selectionMode = false;
  Map<String, List<bool>> _selectedCandidates = {
    'Federal': [],
    'State': [],
    'Local': [],
  };
  int _selectedCount = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleSelectionMode() {
    setState(() {
      _selectionMode = !_selectionMode;
      if (!_selectionMode) {
        _selectedCandidates.updateAll((key, value) => []);
        _selectedCount = 0;
      }
    });
  }

  void _toggleCandidate(String category, int index) {
    if (_selectionMode) {
      setState(() {
        if (_selectedCandidates[category]![index]) {
          _selectedCandidates[category]![index] = false;
          _selectedCount--;
        } else if (_selectedCount < 2) {
          _selectedCandidates[category]![index] = true;
          _selectedCount++;
        }
      });
    }
  }

  void _compareSelections() {
    if (_selectedCount == 2) {
      List<CandidateModel> selectedCandidates = [];
      _selectedCandidates.forEach((category, selections) {
        for (int i = 0; i < selections.length; i++) {
          if (selections[i]) {
            // Fetch the actual CandidateModel for the selected index
            // This might require passing the candidates data to this page
            // or fetching it again from the database
            // selectedCandidates.add(/* Fetch CandidateModel for category and index i */);
          }
        }
      });
      context.push(BaseRouteName.candidatesComparisonPage, extra: selectedCandidates);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        title: "Candidates",
        actions: [
          TextButton(
            onPressed: _toggleSelectionMode,
            child: Text(
              _selectionMode ? 'Cancel' : 'Select',
              style: getPlusJakartaSans(
                  textColor:
                      _selectionMode ? Colors.red : AppColors.appLinkBlue),
            ),
          ),
        ],
        semanticsLabel:
            "List of candidates. Select candidates to view details or compare.",
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              children: [
                Semantics(
                    label: "Search for candidates.",
                    child: const CustomBoxTextField(
                        hintText: 'Search candidates...')),
                const SizedBox(height: 10),
                Container(
                  height: kToolbarHeight - 8.0,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.appSecondaryBackgroundLightGray,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Federal'),
                      Tab(text: 'State'),
                      Tab(text: 'Local'),
                    ],
                    labelColor: AppColors.appGreen,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: getPlusJakartaSans(
                        textColor: AppColors.appBlack,
                        fontsize: 14,
                        fontweight: FontWeight.w500),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.appWhite),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.appGreen,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CandidatesWidget(
                        category: 'Federal',
                        selectedCandidates: _selectedCandidates['Federal']!,
                        selectionMode: _selectionMode,
                        onTap: (index) => _toggleCandidate('Federal', index),
                      ),
                      CandidatesWidget(
                        category: 'State',
                        selectedCandidates: _selectedCandidates['State']!,
                        selectionMode: _selectionMode,
                        onTap: (index) => _toggleCandidate('State', index),
                      ),
                      CandidatesWidget(
                        category: 'Local',
                        selectedCandidates: _selectedCandidates['Local']!,
                        selectionMode: _selectionMode,
                        onTap: (index) => _toggleCandidate('Local', index),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_selectionMode)
            Positioned(
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(22),
                alignment: Alignment.center,
                color: AppColors.appLinkBlue.withOpacity(0.85),
                child: Semantics(
                  label:
                      "Compare selected candidates. $_selectedCount candidates selected.",
                  child: TextButton(
                    onPressed: _compareSelections,
                    child: Text(
                      'Compare Selections ($_selectedCount)',
                      style: getNormalZodiak(
                          textColor: AppColors.appWhite,
                          fontsize: 14,
                          fontweight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}