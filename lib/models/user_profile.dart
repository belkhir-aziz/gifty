class UserProfile {
  final String id;
  final String email;
  late String firstName;
  late String lastName;
  late String gender;
  late DateTime dateOfBirth;
  late String hobbies;

  UserProfile({
    required this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    DateTime? dateOfBirth,
    this.hobbies = '',
  }) : dateOfBirth = dateOfBirth ?? DateTime(1970, 1, 1);

  // Convert a JSON response from Supabase into a UserProfile object
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'])
          : DateTime(1970, 1, 1),
      hobbies: json['hobbies'] ?? '',
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