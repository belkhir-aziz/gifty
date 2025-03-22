import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/recommendation_models/reaction_based_model.dart';
import 'package:datingapp/recommendation_models/trivial_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product.dart';

class ProductHandler {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Product>> fetchProducts(UserProvider userProvider, {int? limit}) async {
    // Fetch reacted product IDs
    // Fetch reacted product IDs
    if (userProvider.cachedProducts != null) {
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
        .select('*, reactions!inner(product_id)')
        .eq('reactions.reaction_type', 'superLike')
        .eq('reactions.user_id', userId);
    if (limit != null) {
      query.limit(limit);
    }
    final response = await query;
    return response.map((json) => Product.fromJson(json)).toList();
  }
}