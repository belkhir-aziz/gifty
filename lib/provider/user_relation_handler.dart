import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/models/user_relations.dart';
import 'package:datingapp/utils/data_types/invitation_status.dart';
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
    await _client
        .from('relations')
        .upsert(userRelations.toJson());
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
      .eq('user_id', userId)
      .eq('status', InvitationStatus.accepted.toString().split('.').last);

  return res.map((item) {
    return UserProfile.fromJson(item['users']);
  }).toList();
}

Future<List<Map<String, dynamic>>> getUserInvitations(String userId) async {
  try {
    // First get the relations with pending invitations
    var relationsRes = await _client
        .from('relations')
        .select('user_id, created_at')
        .eq('friend_id', userId)
        .eq('status', InvitationStatus.pending.toString().split('.').last)
        .order('created_at', ascending: false);

    if (relationsRes.isEmpty) {
      return [];
    }

    // Extract user IDs and creation dates from relations
    var userIds = relationsRes.map((r) => r['user_id'] as String).toList();

    // Get user profiles for those IDs
    var usersRes = await _client
        .from('users')
        .select('id, first_name, last_name, email')
        .inFilter('id', userIds);

    // Combine user data with invitation creation date
    return usersRes.map((userData) {
      var relation = relationsRes.firstWhere((r) => r['user_id'] == userData['id']);
      return {
        'user': UserProfile.fromJson(userData),
        'created_at': DateTime.parse(relation['created_at']),
      };
    }).toList();
  } catch (e) {
    print('Error in getUserInvitations: $e');
    return [];
  }
}

Future<List<UserProfile>> getPendingInvitations(String userId) async {
  final relations = await getUserProfileRelations(userId);
  return relations.where((user) => user.relationStatus == InvitationStatus.pending).toList();
}

Future<void> acceptInvitation(String userId, String friendId) async {
  final relation = UserRelations(
    userId: userId,
    friendId: friendId,
    status: InvitationStatus.accepted,
    createdAt: DateTime.now(),
  );
  await updateUserRelations(relation);
}

Future<void> rejectInvitation(String userId, String friendId) async {
  final relation = UserRelations(
    userId: userId,
    friendId: friendId,
    status: InvitationStatus.rejected,
    createdAt: DateTime.now(),
  );
  await updateUserRelations(relation);
}
}