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
}