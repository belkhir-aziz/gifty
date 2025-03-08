class UserProfile {
  final String id;
  final String email;
  late  String firstName;
  late  String lastName;
  late  String gender;
  late  DateTime dateOfBirth;
  late  String hobbies;

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
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'hobbies': hobbies,
    };
  }
}
