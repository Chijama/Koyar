// lib/models/candidate_model.dart
class CandidateModel {
  final String? candidateName;
  final String? headshots;
  final String? expectedPolicies;
  final String? notableFacts;
  final String? party;
  final String? profileOverview;
  final List<String>? usefulLinks;
  final CandidateInfo candidateInfo;
  final DeputyInfo deputyInfo;

  CandidateModel({
    required this.candidateName,
    required this.headshots,
    required this.expectedPolicies,
    required this.notableFacts,
    required this.party,
    required this.profileOverview,
    required this.usefulLinks,
    required this.candidateInfo,
    required this.deputyInfo,
  });

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      candidateName: json['Candidate'] as String?,
      headshots: json['Headshots'] as String?,
      expectedPolicies: json['Expected Policies'] as String?,
      notableFacts: json['Noteable Facts'] as String?,
      party: json['Party'] as String?,
      profileOverview: json['Profile Overview'] as String?,
      usefulLinks: List<String>.from(json['Useful Links'] ?? []),
      candidateInfo: CandidateInfo.fromJson(json['candidateInfo']),
      deputyInfo: DeputyInfo.fromJson(json['deputyinfo']),
    );
  }
}

class CandidateInfo {
  final String? age;
  final String? gender;
  final String? occupation;
  final String? qualification;

  CandidateInfo({
    required this.age,
    required this.gender,
    required this.occupation,
    required this.qualification,
  });

  factory CandidateInfo.fromJson(Map<String, dynamic> json) {
    return CandidateInfo(
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      occupation: json['occupation'] as String?,
      qualification: json['qualification'] as String?,
    );
  }
}

class DeputyInfo {
  final String? age;
  final String? gender;
  final String? name;
  final String? qualification;

  DeputyInfo({
    required this.age,
    required this.gender,
    required this.name,
    required this.qualification,
  });

  factory DeputyInfo.fromJson(Map<String, dynamic> json) {
    return DeputyInfo(
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      name: json['name'] as String?,
      qualification: json['qualification'] as String?,
    );
  }
}
