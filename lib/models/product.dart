import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final String id;
  final String imageUrl;
  final String? name;
  final String? description;
  final String? category;
  final double? price;
  final String? affiliateLink;
  final bool? availability;
  final double? rating;

  Product({
    required this.id,
    required this.imageUrl,
    this.name,
    this.description,
    this.category,
    this.price,
    this.affiliateLink,
    this.availability,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      imageUrl: json['image_url'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      affiliateLink: json['affiliate_link'],
      availability: json['availability'],
      rating: json['rating']?.toDouble(),
    );
  }
}
