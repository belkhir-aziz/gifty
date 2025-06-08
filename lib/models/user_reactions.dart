import 'package:datingapp/utils/data_types/reaction_types.dart';

class Reaction {
  final String userId;
  final String productId;
  final DateTime createdAt;
  final ReactionTypes reactionType;
  final bool reserved;
  final String? reservedByUserId;

  Reaction({
    required this.userId,
    required this.productId,
    required this.createdAt,
    required this.reactionType,
    this.reserved = false,
    this.reservedByUserId,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      userId: json['user_id'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['created_at']),
      reactionType: json['reaction_type'],
      reserved: json['reserved'] ?? false,
      reservedByUserId: json['reserved_by_user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
      'created_at': createdAt.toIso8601String(),
      'reaction_type': reactionType.toString().split('.').last,
      'reserved': reserved,
      'reserved_by_user_id': reservedByUserId,
    };
  }
}