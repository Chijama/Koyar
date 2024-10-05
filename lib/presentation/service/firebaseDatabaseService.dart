import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/auth/models/user_model.dart';
import 'package:koyar/presentation/features/candidates/models/candidateModel.dart';
import 'package:koyar/presentation/features/news/models/newsModel.dart';

class FirebaseDatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance
      .ref('10eR6EOsiucKYr6nXSvwSi59bCitTbhXjEJ-NEiWBs2Y');

  // Function to write a user to the database
  Future<void> writeUser(User user) async {
    try {
      await _dbRef.child('users').child(user.id!).set(user.toJson());
      debugPrint('User written successfully.');
    } catch (error) {
      debugPrint('Failed to write user: $error');
      rethrow; // Rethrow the error to handle it in the repository or view
    }
  }

  // Function to get articles from the database
  Future<List<String>> getArticles() async {
    try {
      DataSnapshot snapshot = await _dbRef.child('Articles').get();
      return List<String>.from(snapshot.value as List? ?? []);
    } catch (error) {
      debugPrint('Failed to get articles: $error');
      return []; // Return an empty list in case of error
    }
  }

  // Function to get election timeline data from the database
  Future<Map<String, dynamic>> getElectionTimeline() async {
    try {
      DataSnapshot snapshot = await _dbRef.child('Election Timeline').get();
      if (snapshot.value != null) {
        return Map<String, dynamic>.from(
            snapshot.value as Map<Object?, Object?>);
      }
      return {};
    } catch (error) {
      debugPrint('Failed to get election timeline: $error');
      return {}; // Return an empty map in case of error
    }
  }

  Future<Map<String, dynamic>> getVotersGuide() async {
    try {
      DataSnapshot snapshot = await _dbRef.child('Voting Guide').get();
      if (snapshot.value != null) {
        return Map<String, dynamic>.from(
            snapshot.value as Map<Object?, Object?>);
      }
      return {};
    } catch (error) {
      debugPrint('Failed to get Voters guide: $error');
      return {}; // Return an empty map in case of error
    }
  }
  // Function to fetch presidential candidates from the database

  Future<List<CandidateModel>> fetchPresidentialCandidates() async {
    List<CandidateModel> candidates = [];

    try {
      DataSnapshot snapshot = await _dbRef.child('Presidential').get();
      debugPrint("### Presidential snapshot ${snapshot.value}");
      if (snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        data.forEach((key, value) {
          if (value is Map<dynamic, dynamic>) {
            final candidateData = _convertToStringDynamic(value);
            candidates.add(CandidateModel.fromJson(candidateData));
          }
        });
      }
    } catch (error) {
      debugPrint('Failed to fetch presidential candidates: $error');
    }

    return candidates;
  }

  Future<List<CandidateModel>> fetchGubernatorialCandidates() async {
    List<CandidateModel> candidates = [];

    try {
      DataSnapshot snapshot = await _dbRef.child('Gubernatorial').get();

      if (snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        data.forEach((key, value) {
          if (value is Map<dynamic, dynamic>) {
            final candidateData = _convertToStringDynamic(value);
            candidates.add(CandidateModel.fromJson(candidateData));
          }
        });
      }
    } catch (error) {
      debugPrint('Failed to fetch Gubernatorial candidates: $error');
    }

    return candidates;
  }

  Future<List<CandidateModel>> fetchHouseofAssemblyCandidates() async {
    List<CandidateModel> candidates = [];

    try {
      DataSnapshot snapshot =
          await _dbRef.child('Ondo State House of Assembly').get();

      if (snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        data.forEach((key, value) {
          if (value is Map<dynamic, dynamic>) {
            final candidateData = _convertToStringDynamic(value);
            candidates.add(CandidateModel.fromJson(candidateData));
          }
        });
      }
    } catch (error) {
      debugPrint('Failed to fetch House of Assembly candidates: $error');
    }

    return candidates;
  }

  Future<List<CandidateModel>> fetchHouseofRepresentativesCandidates() async {
    List<CandidateModel> candidates = [];

    try {
      DataSnapshot snapshot =
          await _dbRef.child('House of Representatives').get();

      if (snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        data.forEach((key, value) {
          if (value is Map<dynamic, dynamic>) {
            final candidateData = _convertToStringDynamic(value);
            candidates.add(CandidateModel.fromJson(candidateData));
          }
        });
      }
    } catch (error) {
      debugPrint('Failed to fetch House of Representatives candidates: $error');
    }

    return candidates;
  }

  Map<String, dynamic> _convertToStringDynamic(Map<dynamic, dynamic> input) {
    return input.map((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), _convertToStringDynamic(value));
      } else if (value is List) {
        return MapEntry(key.toString(), _convertListToStringDynamic(value));
      } else {
        return MapEntry(key.toString(), value);
      }
    });
  }

  List<dynamic> _convertListToStringDynamic(List<dynamic> input) {
    return input.map((item) {
      if (item is Map) {
        return _convertToStringDynamic(item);
      } else if (item is List) {
        return _convertListToStringDynamic(item);
      } else {
        return item;
      }
    }).toList();
  }

  Future<List<NewsModel>> fetchArticles() async {
    try {
      final snapshot = await _dbRef.child('Articles').get();
      if (snapshot.exists) {
        Map<Object?, Object?> data = snapshot.value as Map<Object?, Object?>;
        return data.entries.map((entry) {
          return NewsModel.fromJson(
              Map<String, dynamic>.from(entry.value as Map));
        }).toList();
      } else {
        throw Exception('No articles found');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }
}
