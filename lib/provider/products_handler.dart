import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product.dart';

class ProductHandler {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Product>> getAllProducts({int? limit}) async {
    final query = supabase.from('products').select();
    if (limit != null) {
      query.limit(limit);
    }
    final response = await query;
    return response.map((json) => Product.fromJson(json)).toList();
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