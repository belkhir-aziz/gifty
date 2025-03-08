class UserProfile {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime dateOfBirth;
  final String hobbies;

  UserProfile({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    required this.hobbies,
  });

  // Convert a JSON response from Supabase into a UserProfile object
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      hobbies: json['hobbies'],
    );
  }

  // Convert a UserProfile object into JSON for requests
  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'hobbies': hobbies,
    };
  }
}
