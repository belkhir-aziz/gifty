import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile.dart';

class UserProfileHandler {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> createUserProfile(UserProfile userProfile) async {
  final response = await supabase.from('users').insert(userProfile.toJson())
      .select(); // Use .select() to get the response
  if (response.isEmpty) {
    throw Exception('Failed to create profile: No response received.');
  }
}

  Future<UserProfile> getUserProfile(String id) async {
    final response = await supabase.from('users').select().eq('id', id).single();
    return UserProfile.fromJson(response);
  }

  Future<UserProfile?> getUserProfileWithEmail(String email) async {
  try {
    final response = await supabase
        .from('users')
        .select()
        .eq('email', email)
        .single();

    return UserProfile.fromJson(response);
  } catch (e) {
    return null;
  }
}

Future<void> editUserProfile(UserProfile userProfile) async {
  final response = await supabase
      .from('users')
      .update(userProfile.toJson())
      .eq('id', userProfile.id)
      .select();

  if (response.isEmpty) {
    throw Exception('Failed to update profile: No response received.');
  }
}


}
