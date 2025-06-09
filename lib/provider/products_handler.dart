import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_reactions_handler.dart';
import 'package:datingapp/recommendation_models/reaction_based_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product.dart';

class ProductHandler {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Product>> fetchProducts(UserProvider userProvider, {int? limit}) async {
    // Fetch reacted product IDs
    // Fetch reacted product IDs
    if (userProvider.cachedProducts != null && userProvider.cachedProducts!.isNotEmpty) {
      return userProvider.cachedProducts  ?? [];
    }

    final recommender = ReactionBasedModel();
    final products = await recommender.getRecomendations(userProvider);
    userProvider.setCachedProducts(products);

    return products;
  }

  Future<List<Product>> getSuperLikedProductsByUser(String userId, {int? limit}) async {
    final query = supabase
        .from('products')
        .select('*, reactions!inner(product_id, reserved, reserved_by_user_id)')
        .eq('reactions.reaction_type', 'superLike')
        .eq('reactions.user_id', userId);
    if (limit != null) {
      query.limit(limit);
    }
    final response = await query;
    return response.map((json) => Product.fromJson(json)).toList();
  }

  Future<Map<String, dynamic>> getSuperLikedProductsWithReservationsByUser(String userId, {int? limit}) async {
    final query = supabase
        .from('products')
        .select('*, reactions!inner(product_id, reserved, reserved_by_user_id)')
        .eq('reactions.reaction_type', 'superLike')
        .eq('reactions.user_id', userId);
    if (limit != null) {
      query.limit(limit);
    }
    final response = await query;
    
    List<Product> products = [];
    Map<String, bool> reservationStatus = {};
    Map<String, String?> reservedByUsers = {};
    
    for (var item in response) {
      final product = Product.fromJson(item);
      products.add(product);
      
      final reactions = item['reactions'] as List;
      if (reactions.isNotEmpty) {
        final reaction = reactions.first;
        reservationStatus[product.id] = reaction['reserved'] ?? false;
        reservedByUsers[product.id] = reaction['reserved_by_user_id'];
      }
    }
    
    return {
      'products': products,
      'reservationStatus': reservationStatus,
      'reservedByUsers': reservedByUsers,
    };
  }

  Future<void> removeFromWishlist(String userId, String productId) async {
    final userReactionsHandler = UserReactionsHandler();
    await userReactionsHandler.removeFromWishlist(userId, productId);
  }

  Future<void> reserveProduct(String userId, String productId, String reservedByUserId) async {
    final userReactionsHandler = UserReactionsHandler();
    await userReactionsHandler.reserveProduct(userId, productId, reservedByUserId);
  }

  Future<void> unreserveProduct(String userId, String productId) async {
    final userReactionsHandler = UserReactionsHandler();
    await userReactionsHandler.unreserveProduct(userId, productId);
  }
}