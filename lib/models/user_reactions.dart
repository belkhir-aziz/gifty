import 'package:datingapp/screens/add_story_screen.dart';

class Reaction {
  final String userId;
  final String productId;
  final DateTime createdAt;
  final ReactionTypes reactionType;

  Reaction({
    required this.userId,
    required this.productId,
    required this.createdAt,
    required this.reactionType,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      userId: json['user_id'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['created_at']),
      reactionType: json['reaction_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
      'created_at': createdAt.toIso8601String(),
      'reaction_type': reactionType.toString().split('.').last,
    };
  }
}