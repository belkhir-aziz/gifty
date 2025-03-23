import 'package:datingapp/models/product.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/recommendation_models/base_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FilterModel implements BaseModel {
  final SupabaseClient supabase = Supabase.instance.client;

  FilterModel();

  @override
  Future<List<Product>> getRecomendations(UserProvider userProvider) async {
    // Fetch reacted product IDs
    final reactedProductIds = await getReactedProductIds(userProvider.userProfile!.id);

    // Fetch all products with country and category filters
    final productResponse = await supabase
        .from('products')
        .select('*')
        .eq('country', userProvider.userProfile!.merchantCountry)
        .filter('category', 'in', userProvider.userProfile!.hobbies);

    // Filter out products that have reactions from the user
    final unseenProducts = productResponse
        .where((product) => !reactedProductIds.contains(product['id']))
        .map((json) => Product.fromJson(json))
        .toList();

    return unseenProducts;
  }

  Future<List<String>> getReactedProductIds(String userId) async {
    final response = await supabase
        .from('reactions')
        .select('product_id')
        .eq('user_id', userId);

    // Cast the dynamic response data to List<String>
    return (response as List<dynamic>).map((reaction) => reaction['product_id'] as String).toList();
  }
}