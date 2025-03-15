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
}