class User {
  final String? id;
  final String? nin;
  final String? stateOfRegistration;
  final String? lgaOfRegistration;
  final List<String>? electionPreferences;

  User({
      this.id,
      this.nin,
      this.stateOfRegistration,
      this.lgaOfRegistration,
      this.electionPreferences,
  });

  // Convert a User object into a map for writing to the database
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nin': nin,
      'stateOfRegistration': stateOfRegistration,
      'lgaOfRegistration': lgaOfRegistration,
      'electionPreferences': electionPreferences,
    };
  }

  // Convert a map into a User object (for reading from the database)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nin: json['nin'],
      stateOfRegistration: json['stateOfRegistration'],
      lgaOfRegistration: json['lgaOfRegistration'],
      electionPreferences: List<String>.from(json['electionPreferences']),
    );
  }
}
