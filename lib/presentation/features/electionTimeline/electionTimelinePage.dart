import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koyar/presentation/common/appBar.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';
import 'package:koyar/presentation/service/firebaseDatabaseService.dart';

class ElectionTimelinePage extends StatefulWidget {
  const ElectionTimelinePage({super.key});

  @override
  State<ElectionTimelinePage> createState() => _ElectionTimelinePageState();
}

class _ElectionTimelinePageState extends State<ElectionTimelinePage> {
  final FirebaseDatabaseService _dataService = FirebaseDatabaseService();
  late PageController _pageController;
  late DateTime _currentMonth;
  final List<DateTime> _months = [];

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _initializeMonths();
    _pageController = PageController(initialPage: 6); // Start at current month
  }

  void _initializeMonths() {
    DateTime startMonth =
        DateTime(_currentMonth.year, _currentMonth.month - 6, 1);
    for (int i = 0; i < 13; i++) {
      _months.add(DateTime(startMonth.year, startMonth.month + i, 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      appBar: const CustomAppBar(
        title: 'Election Timeline',
        semanticsLabel: 'Election Timeline Page',
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _dataService.getElectionTimeline(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No timeline data available'));
          } else {
            return _buildTimelineContent(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildTimelineContent(Map<String, dynamic> electionEvents) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildMonthSelector(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentMonth = _months[index];
                });
              },
              itemCount: _months.length,
              itemBuilder: (context, index) {
                return _buildEventList(_months[index], electionEvents);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList(DateTime month, Map<String, dynamic> electionEvents) {
    List<MapEntry<String, dynamic>> eventsThisMonth =
        electionEvents.entries.where((entry) {
      DateTime eventDate = DateTime.parse(entry.value['Date']);
      return eventDate.year == month.year && eventDate.month == month.month;
    }).toList();

    return Semantics(
      label: 'Events for ${DateFormat('MMMM yyyy').format(month)}',
      child: Container(
        color: AppColors.appSecondaryBackgroundLightGray,
        child: eventsThisMonth.isEmpty
            ? Center(
                child: Text(
                    'No events for ${DateFormat('MMMM yyyy').format(month)}'))
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: eventsThisMonth.length,
                itemBuilder: (context, index) {
                  final event = eventsThisMonth[index];
                  final eventDate = DateTime.parse(event.value['Date']);
                  return Column(
                    children: [
                      _buildEventCard(event.value['Event'], eventDate),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    int currentIndex = _months.indexOf(_currentMonth);
    return Semantics(
      label: 'Month selector',
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: AppColors.appSecondaryBackgroundLightGray,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Semantics(
              label: currentIndex > 0
                  ? 'Previous month ${DateFormat('MMMM').format(_months[currentIndex - 1])}'
                  : 'No previous month',
              child: Text(
                currentIndex > 0
                    ? DateFormat('MMM').format(_months[currentIndex - 1])
                    : '',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Semantics(
              label: 'Previous month button',
              button: true,
              child: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: currentIndex > 0
                    ? () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
              ),
            ),
            Semantics(
              label:
                  'Current month ${DateFormat('MMMM').format(_currentMonth)}',
              child: Text(
                DateFormat('MMM').format(_currentMonth),
                style: getPlusJakartaSans(
                  textColor: AppColors.appPrimaryTextDarkGray,
                  fontsize: 18,
                  fontweight: FontWeight.w500,
                ),
              ),
            ),
            Semantics(
              label: 'Next month button',
              button: true,
              child: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: currentIndex < _months.length - 1
                    ? () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
              ),
            ),
            Semantics(
              label: currentIndex < _months.length - 1
                  ? 'Next month ${DateFormat('MMMM').format(_months[currentIndex + 1])}'
                  : 'No next month',
              child: Text(
                currentIndex < _months.length - 1
                    ? DateFormat('MMM').format(_months[currentIndex + 1])
                    : '',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, DateTime date) {
    return Semantics(
      label: 'Event on ${DateFormat('MMMM d, yyyy').format(date)}: $title',
      child: Card(
        elevation: 0.5,
        color: AppColors.appWhite,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    label: 'Event date: ${date.day}',
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: getBlackZodiak(
                                fontsize: 18, fontweight: FontWeight.w500)),
                        const SizedBox(height: 6),
                        Text(DateFormat('MMMM d, yyyy').format(date),
                            style: getPlusJakartaSans(
                                textColor: AppColors.appSecondaryTextMediumGray,
                                fontsize: 14,
                                fontweight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Semantics(
                label: 'See details button',
                button: true,
                child: Text('See details',
                    style: getPlusJakartaSans(
                            textColor: AppColors.appBlack,
                            fontsize: 10,
                            fontweight: FontWeight.w400)
                        .copyWith(decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
