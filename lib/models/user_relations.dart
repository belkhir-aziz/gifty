import 'package:datingapp/utils/data_types/invitation_status.dart';

class UserRelations {
  final String userId;
  final String friendId;
  final DateTime createdAt;
  final InvitationStatus status;

  UserRelations({
    required this.userId,
    required this.friendId,
    required this.createdAt,
    required this.status,
  });

  // Convert a JSON response from Supabase into a UserRelation object
  factory UserRelations.fromJson(Map<String, dynamic> json) {
    return UserRelations(
      userId: json['user_id'],
      friendId: json['friend_id'],
      createdAt: DateTime.parse(json['created_at']),      
      status: InvitationStatus.values.firstWhere((e) => e.toString().split('.').last == json['status']),
    );
  }

  // Convert a UserRelation object into JSON for requests
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'friend_id': friendId,
      'created_at': createdAt.toIso8601String(),
      'status': status.toString().split('.').last,
    };
  }
}