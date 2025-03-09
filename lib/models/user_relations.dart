class UserRelations {
  final String userId;
  final String friendId;
  final DateTime createdAt;

  UserRelations({
    required this.userId,
    required this.friendId,
    required this.createdAt,
  });

  // Convert a JSON response from Supabase into a UserRelation object
  factory UserRelations.fromJson(Map<String, dynamic> json) {
    return UserRelations(
      userId: json['user_id'],
      friendId: json['friend_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Convert a UserRelation object into JSON for requests
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'friend_id': friendId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}