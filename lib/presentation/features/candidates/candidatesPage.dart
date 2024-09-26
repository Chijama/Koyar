import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class CandidateSelectionPage extends StatefulWidget {
  @override
  _CandidateSelectionPageState createState() => _CandidateSelectionPageState();
}

class _CandidateSelectionPageState extends State<CandidateSelectionPage> {
  bool _selectionMode = false;
  List<bool> _selectedCandidates = List.generate(6, (_) => false);
  int _selectedCount = 0;

  void _toggleSelectionMode() {
    setState(() {
      _selectionMode = !_selectionMode;
      if (!_selectionMode) {
        _selectedCandidates = List.generate(6, (_) => false);
        _selectedCount = 0;
      }
    });
  }

  void _toggleCandidate(int index) {
    if (_selectionMode) {
      setState(() {
        if (_selectedCandidates[index]) {
          _selectedCandidates[index] = false;
          _selectedCount--;
        } else if (_selectedCount < 2) {
          _selectedCandidates[index] = true;
          _selectedCount++;
        }
      });
    }
  }

  void _compareSelections() {
    if (_selectedCount == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ComparisonPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          label:
              "List of candidates. Select candidates to view details or compare.",
          child: Text('Candidates'),
        ),
        leading: Semantics(
          label: "Go back to the previous screen.",
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          TextButton(
            onPressed: _toggleSelectionMode,
            child: Text(_selectionMode ? 'Cancel' : 'Select'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Semantics(
              label: "Search for candidates.",
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search candidates...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Semantics(
                  label: "Currently filtering by category: Presidential.",
                  child: Text('Category: Presidential'),
                ),
                Semantics(
                  label: "Filter by state.",
                  child: Text('State'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Semantics(
                  label: _selectedCandidates[index]
                      ? "Candidate ${index + 1} selected. Tap to deselect."
                      : "Candidate ${index + 1}, tap to ${_selectionMode ? 'select' : 'view profile'}.",
                  child: GestureDetector(
                    onTap: () => _toggleCandidate(index),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.black,
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
                                    ? Colors.blue
                                    : Colors.white,
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
      ),
      bottomNavigationBar: _selectionMode
          ? BottomAppBar(
              child: Semantics(
                label:
                    "Compare selected candidates. $_selectedCount candidates selected.",
                child: ElevatedButton(
                  onPressed: _compareSelections,
                  child: Text('Compare Selections ($_selectedCount)'),
                ),
              ),
            )
          : null,
    );
  }
}

class ComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comparison')),
      body: Center(child: Text('Comparison Page')),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class CandidateSelectionPage extends StatefulWidget {
  @override
  _CandidateSelectionPageState createState() => _CandidateSelectionPageState();
}

class _CandidateSelectionPageState extends State<CandidateSelectionPage> {
  bool _selectionMode = false;
  List<bool> _selectedCandidates = List.generate(6, (_) => false);
  int _selectedCount = 0;

  void _toggleSelectionMode() {
    setState(() {
      _selectionMode = !_selectionMode;
      if (!_selectionMode) {
        _selectedCandidates = List.generate(6, (_) => false);
        _selectedCount = 0;
      }
    });
  }

  void _toggleCandidate(int index) {
    if (_selectionMode) {
      setState(() {
        _selectedCandidates[index] = !_selectedCandidates[index];
        _selectedCount += _selectedCandidates[index] ? 1 : -1;
      });
    }
  }

  void _compareSelections() {
    if (_selectedCount == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ComparisonPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Semantics(
          label: "Go back to the previous screen.",
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Semantics(
          label: _selectionMode
              ? "List of candidates. Select candidates to compare."
              : "List of candidates. Select candidates to view details or compare.",
          child: Text('Candidates'),
        ),
        actions: [
          TextButton(
            onPressed: _toggleSelectionMode,
            child: Text(_selectionMode ? 'Cancel' : 'Select'),
          ),
        ],
      ),
      body: FocusTraversalGroup(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Semantics(
                label: "Search for candidates.",
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search candidates...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    label: "Filter candidates by category or state.",
                    child: IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {/* Implement filter functionality */},
                    ),
                  ),
                  Semantics(
                    label: "Currently filtering by category: Presidential. Filter by state.",
                    child: Row(
                      children: [
                        Text('Category: Presidential'),
                        SizedBox(width: 10),
                        Text('State'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return FocusTraversalOrder(
                    order: NumericFocusOrder(index + 6.0),
                    child: Semantics(
                      label: _selectionMode
                          ? (_selectedCandidates[index]
                              ? "Candidate ${index + 1} selected. Tap to deselect."
                              : "Candidate ${index + 1}, tap to select.")
                          : "Candidate ${index + 1}, tap to view profile.",
                      child: GestureDetector(
                        onTap: () => _toggleCandidate(index),
                        child: Stack(
                          children: [
                            Container(color: Colors.black),
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
                                        ? Colors.blue
                                        : Colors.white,
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _selectionMode
          ? BottomAppBar(
              child: Semantics(
                label: "Compare selected candidates. $_selectedCount candidates selected.",
                child: FocusTraversalOrder(
                  order: NumericFocusOrder(12.0),
                  child: ElevatedButton(
                    onPressed: _compareSelections,
                    child: Text('Compare Selections ($_selectedCount)'),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class ComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comparison')),
      body: Center(child: Text('Comparison Page')),
    );
  }
}






