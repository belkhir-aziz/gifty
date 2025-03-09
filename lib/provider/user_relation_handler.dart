import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/models/user_relations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRelationsHandler {
  final SupabaseClient _client = Supabase.instance.client;

  UserRelationsHandler();

  Future<List<UserRelations>> getUserRelations(String userId) async {
    final response = await _client
        .from('relations')
        .select()
        .eq('user_id', userId);

    return (response as List)
        .map((json) => UserRelations.fromJson(json))
        .toList();
  }

  Future<void> addUserRelations(UserRelations userRelations) async {
    final response = await _client
        .from('relations')
        .insert(userRelations.toJson());

    if (response.error != null) {
      throw response.error!;
    }
  }

  Future<void> updateUserRelations(UserRelations userRelations) async {
    final response = await _client
        .from('relations')
        .update(userRelations.toJson())
        .eq('user_id', userRelations.userId)
        .eq('friend_id', userRelations.friendId);

    if (response.error != null) {
      throw response.error!;
    }
  }

  Future<void> deleteUserRelations(String userId, String friendId) async {
    final response = await _client
        .from('relations')
        .delete()
        .eq('user_id', userId)
        .eq('friend_id', friendId);

    if (response.error != null) {
      throw response.error!;
    }
  }
  
  Future<List<UserProfile>> getUserProfileRelations(String userId) async {
  var res = await _client
      .from('relations')
      .select('user_id, friend_id, users!friend_id(id, first_name, last_name, email)')
      .eq('user_id', userId);

  return res.map((item) {
    return UserProfile.fromJson(item['users']);
  }).toList();
}
}