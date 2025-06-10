import 'package:datingapp/models/product.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/recommendation_models/base_model.dart';
import 'package:datingapp/helpers/country_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FilterModel implements BaseModel {
  final SupabaseClient supabase = Supabase.instance.client;

  FilterModel();

  // Map country names to country codes
  String _getCountryCode(String countryName) {
    const countryMap = {
      'United States': 'US',
      'Canada': 'CA',
      'United Kingdom': 'UK',
      'Germany': 'DE',
      'France': 'FR',
      'Italy': 'IT',
      'Spain': 'ES',
      'Netherlands': 'NL',
      'Belgium': 'BE',
      'Switzerland': 'CH',
      'Austria': 'AT',
      'Sweden': 'SE',
      'Norway': 'NO',
      'Denmark': 'DK',
      'Finland': 'FI',
      'Australia': 'AU',
      'New Zealand': 'NZ',
      'Japan': 'JP',
      'South Korea': 'KR',
      'Singapore': 'SG',
      'Brazil': 'BR',
      'Argentina': 'AR',
      'Mexico': 'MX',
      'India': 'IN',
      'China': 'CN',
      'Thailand': 'TH',
      'Malaysia': 'MY',
      'Indonesia': 'ID',
      'Philippines': 'PH',
      'Vietnam': 'VN',
    };
    
    return countryMap[countryName] ?? countryName;
  }

  @override
  Future<List<Product>> getRecomendations(UserProvider userProvider) async {
    // Check if user profile exists
    if (userProvider.userProfile == null) {
      return [];
    }

    // Fetch reacted product IDs
    final reactedProductIds = await getReactedProductIds(userProvider.userProfile!.id);

    // Check if user profile is complete (has merchantCountry and hobbies)
    final hasCountry = userProvider.userProfile!.merchantCountry.isNotEmpty;
    final hasHobbies = userProvider.userProfile!.hobbies.isNotEmpty;

    List<dynamic> productResponse;

    if (hasCountry && hasHobbies) {
      // Convert country name to country code and get fallback
      final originalCountryCode = _getCountryCode(userProvider.userProfile!.merchantCountry);
      final countryCode = CountryHandler.getFallbackCountry(originalCountryCode);
      
      // First try with both country and category filters
      productResponse = await supabase
          .from('products')
          .select('*')
          .eq('country', countryCode)
          .filter('category', 'in', userProvider.userProfile!.hobbies);
      
      // If no products found with strict filtering, try with just country
      if (productResponse.isEmpty) {
        productResponse = await supabase
            .from('products')
            .select('*')
            .eq('country', countryCode);
        
        // If still no products, try without any filters
        if (productResponse.isEmpty) {
          productResponse = await supabase
              .from('products')
              .select('*');
        }
      }
    } else if (hasCountry) {
      // Convert country name to country code and get fallback
      final originalCountryCode = _getCountryCode(userProvider.userProfile!.merchantCountry);
      final countryCode = CountryHandler.getFallbackCountry(originalCountryCode);
      
      // Fetch products with country filter
      productResponse = await supabase
          .from('products')
          .select('*')
          .eq('country', countryCode);
      
      // If no products found, try without country filter
      if (productResponse.isEmpty) {
        productResponse = await supabase
            .from('products')
            .select('*');
      }
    } else {
      // Fetch all products for new users or incomplete profiles
      productResponse = await supabase
          .from('products')
          .select('*');
    }

    // Filter out products that have reactions from the user
    final unseenProducts = productResponse
        .where((product) => !reactedProductIds.contains(product['id'].toString()))
        .map((json) => Product.fromJson(json))
        .toList();

    return unseenProducts;
  }

  Future<List<String>> getReactedProductIds(String userId) async {
    final response = await supabase
        .from('reactions')
        .select('product_id')
        .eq('user_id', userId);

    // Cast the dynamic response data to List<String> with proper type conversion
    return (response as List<dynamic>).map((reaction) => reaction['product_id'].toString()).toList();
  }
}