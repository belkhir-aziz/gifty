import 'package:datingapp/models/product.dart';
import 'package:datingapp/provider/user_provider.dart';

abstract class BaseModel {
  
  Future<List<Product>> getRecomendations(UserProvider userProvider);

  
}