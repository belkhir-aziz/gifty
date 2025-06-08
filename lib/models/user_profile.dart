import 'package:datingapp/utils/data_types/invitation_status.dart';

class UserProfile {
  final String id;
  final String email;
  late String firstName;
  late String lastName;
  late String gender;
  late DateTime dateOfBirth;
  late List<String> hobbies;
  late String merchantCountry;

  UserProfile({
    required this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    DateTime? dateOfBirth,
    List<String>? hobbies,
    this.merchantCountry = '',
  }) : dateOfBirth = dateOfBirth ?? DateTime(1970, 1, 1),
       hobbies = hobbies ?? [];

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
      hobbies: json['hobbies'] != null
          ? (json['hobbies'] as String).split(', ')
          : [],
      merchantCountry: json['merchant_country'] ?? '',
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
      'hobbies': hobbies.join(', '),
      'merchant_country': merchantCountry,
    };
  }
}