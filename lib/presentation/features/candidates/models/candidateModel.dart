import 'package:uuid/uuid.dart';

// Create a UUID generator
const Uuid uuid = Uuid();

class CandidateModel {
  final String id;
  final String candidate;
  final String expectedPolicies;
  final String headshots;
  final String noteableFacts;
  final String party;
  final String profileOverview;
  final String usefulLinks;
  final CandidateInfo candidateInfo;
  final DeputyInfo deputyInfo;
  final bool isFakePicture;

  CandidateModel({
    String? id,
    required this.candidate,
    required this.expectedPolicies,
    required this.headshots,
    required this.noteableFacts,
    required this.party,
    required this.profileOverview,
    required this.usefulLinks,
    required this.candidateInfo,
    required this.deputyInfo,
    required this.isFakePicture,
  }) : id = id ?? uuid.v4();

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      id: json['id'] ?? uuid.v4(), // Generate ID if not in JSON
      candidate: json['Candidate'] ?? '',
      expectedPolicies: json['Expected Policies'] ?? '',
      headshots: json['Headshots'] ?? '',
      noteableFacts: json['Noteable Facts'] ?? '',
      party: json['Party'] ?? '',
      profileOverview: json['Profile Overview'] ?? '',
      usefulLinks: json['Useful Links'] ?? '',
      candidateInfo: CandidateInfo.fromJson(json['candidateInfo']),
      deputyInfo: DeputyInfo.fromJson(json['deputyinfo']),
      isFakePicture:
          json['isFakePicture'] == 'Yes', // assuming isFakePicture is a string
    );
  }
}

class CandidateInfo {
  final int age;
  final String gender;
  final String occupation;
  final String qualification;

  CandidateInfo({
    required this.age,
    required this.gender,
    required this.occupation,
    required this.qualification,
  });

  factory CandidateInfo.fromJson(Map<String, dynamic> json) {
    return CandidateInfo(
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      occupation: json['occupation'] ?? '',
      qualification: json['qualification'] ?? '',
    );
  }
}

class DeputyInfo {
  final int age;
  final String gender;
  final String name;
  final String qualification;

  DeputyInfo({
    required this.age,
    required this.gender,
    required this.name,
    required this.qualification,
  });

  factory DeputyInfo.fromJson(Map<String, dynamic> json) {
    return DeputyInfo(
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      name: json['name'] ?? '',
      qualification: json['qualification'] ?? '',
    );
  }
}
