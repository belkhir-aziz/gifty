class ProductReservation {
  final String id;
  final String productId;
  final String reservedByUserId;
  final String reservedForUserId;
  final DateTime createdAt;
  final String? note;

  ProductReservation({
    required this.id,
    required this.productId,
    required this.reservedByUserId,
    required this.reservedForUserId,
    required this.createdAt,
    this.note,
  });

  factory ProductReservation.fromJson(Map<String, dynamic> json) {
    return ProductReservation(
      id: json['id'],
      productId: json['product_id'],
      reservedByUserId: json['reserved_by_user_id'],
      reservedForUserId: json['reserved_for_user_id'],
      createdAt: DateTime.parse(json['created_at']),
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'reserved_by_user_id': reservedByUserId,
      'reserved_for_user_id': reservedForUserId,
      'created_at': createdAt.toIso8601String(),
      'note': note,
    };
  }
}