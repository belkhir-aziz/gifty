import 'package:collection/collection.dart';
import 'package:datingapp/models/product.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/recommendation_models/base_model.dart';
import 'package:datingapp/recommendation_models/filter_model.dart';
import 'package:datingapp/recommendation_models/trivial_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReactionBasedModel implements BaseModel {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<List<Product>> getRecomendations(UserProvider userProvider) async {
    final userId = userProvider.userProfile?.id;
    if (userId == null) {
      return [];
    }

    // Calculate product scores
    final productScores = await calculateProductScores();

    FilterModel trivialModel = FilterModel();
    var notSelectedProducts = await trivialModel.getRecomendations(userProvider);

    // Sort the products based on the productScores
    notSelectedProducts.sort((a, b) {
      final scoreA = productScores[a.id] ?? 0;
      final scoreB = productScores[b.id] ?? 0;
      return scoreB.compareTo(scoreA);
    });

    return notSelectedProducts;
  }

  Future<Map<String, double>> calculateProductScores() async {
    final response = await supabase
        .from('reactions')
        .select('product_id, reaction_type');

    final reactions = response.map((json) => {
      'product_id': json['product_id'],
      'reaction_type': json['reaction_type']
    }).toList();

    // Group reactions by product_id
    final groupedReactions = groupBy(reactions, (reaction) => reaction['product_id']);

    // Calculate scores for each product
    final productScores = <String, double>{};

    groupedReactions.forEach((productId, productReactions) {
      int superLikeCount = 0;
      int likeCount = 0;
      int dislikeCount = 0;

      productReactions.forEach((reaction) {
        if (reaction['reaction_type'] == 'superLike') {
          superLikeCount++;
        } else if (reaction['reaction_type'] == 'like') {
          likeCount++;
        } else if (reaction['reaction_type'] == 'dislike') {
          dislikeCount++;
        }
      });

      int nbInteraction = superLikeCount + likeCount + dislikeCount;
      double score = (3 * superLikeCount + likeCount - dislikeCount) / nbInteraction;

      productScores[productId] = score;
    });

    return productScores;
  }
}