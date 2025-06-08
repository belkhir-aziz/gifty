import 'package:datingapp/models/user_reactions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserReactionsHandler {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> saveReaction(Reaction reaction) async {
    final response = await supabase.from('reactions').insert(reaction.toJson());
    if (response.error != null) {
      throw Exception('Failed to save reaction: ${response.error!.message}');
    }
  }

  Future<List<Reaction>> getReactionsByUser(String userId) async {
    final response = await supabase
        .from('reactions')
        .select()
        .eq('user_id', userId);

    return response.map((json) => Reaction.fromJson(json)).toList();
  }

  Future<List<Reaction>> getReactionsByProduct(String productId) async {
    final response = await supabase
        .from('reactions')
        .select()
        .eq('product_id', productId);

    return response.map((json) => Reaction.fromJson(json)).toList();
  }

  Future<void> updateReaction(String userId, String productId, String newReactionType) async {
    final response = await supabase
        .from('reactions')
        .update({'reaction_type': newReactionType})
        .eq('user_id', userId)
        .eq('product_id', productId);
    
    if (response.error != null) {
      throw Exception('Failed to update reaction: ${response.error!.message}');
    }
  }

  Future<void> removeFromWishlist(String userId, String productId) async {
    // Update reaction from superLike to like to remove from wishlist
    await updateReaction(userId, productId, 'like');
  }

  Future<void> reserveProduct(String userId, String productId, String reservedByUserId) async {
    final response = await supabase
        .from('reactions')
        .update({
          'reserved': true,
          'reserved_by_user_id': reservedByUserId,
        })
        .eq('user_id', userId)
        .eq('product_id', productId);
    
    if (response.error != null) {
      throw Exception('Failed to reserve product: ${response.error!.message}');
    }
  }

  Future<void> unreserveProduct(String userId, String productId) async {
    final response = await supabase
        .from('reactions')
        .update({
          'reserved': false,
          'reserved_by_user_id': null,
        })
        .eq('user_id', userId)
        .eq('product_id', productId);
    
    if (response.error != null) {
      throw Exception('Failed to unreserve product: ${response.error!.message}');
    }
  }
}