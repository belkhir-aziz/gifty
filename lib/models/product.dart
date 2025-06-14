
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
      id: json['id'].toString(),
      imageUrl: json['image_url'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      affiliateLink: json['affiliate_link'],
      availability: json['availability'],
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
    );
  }
}
