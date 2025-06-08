import 'package:datingapp/models/product_reservation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductReservationHandler {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> reserveProduct(ProductReservation reservation) async {
    final response = await supabase.from('product_reservations').insert(reservation.toJson());
    if (response.error != null) {
      throw Exception('Failed to reserve product: ${response.error!.message}');
    }
  }

  Future<void> unreserveProduct(String productId, String reservedForUserId) async {
    final response = await supabase
        .from('product_reservations')
        .delete()
        .eq('product_id', productId)
        .eq('reserved_for_user_id', reservedForUserId);
    
    if (response.error != null) {
      throw Exception('Failed to unreserve product: ${response.error!.message}');
    }
  }

  Future<List<ProductReservation>> getReservationsByUser(String userId) async {
    final response = await supabase
        .from('product_reservations')
        .select()
        .eq('reserved_for_user_id', userId);

    return response.map((json) => ProductReservation.fromJson(json)).toList();
  }

  Future<List<ProductReservation>> getReservationsByReserver(String reserverId) async {
    final response = await supabase
        .from('product_reservations')
        .select()
        .eq('reserved_by_user_id', reserverId);

    return response.map((json) => ProductReservation.fromJson(json)).toList();
  }

  Future<ProductReservation?> getReservationForProduct(String productId, String userId) async {
    final response = await supabase
        .from('product_reservations')
        .select()
        .eq('product_id', productId)
        .eq('reserved_for_user_id', userId)
        .maybeSingle();

    if (response == null) return null;
    return ProductReservation.fromJson(response);
  }

  Future<bool> isProductReserved(String productId, String userId) async {
    final reservation = await getReservationForProduct(productId, userId);
    return reservation != null;
  }
}