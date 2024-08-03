import 'dart:convert';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String thumbnail;
  final int weight;
  final Dimensions dimensions;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.thumbnail,
    required this.weight,
    required this.dimensions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'weight': weight,
      'dimensions': dimensions.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: map['price'].toDouble() as double,
      discountPercentage: map['discountPercentage'].toDouble() as double,
      rating: map['rating'].toDouble() as double,
      stock: map['stock'].toInt() as int,
      tags: List<String>.from((map['tags'])),
      brand: map['brand'] ?? '',
      thumbnail: map['thumbnail'] as String,
      weight: map['weight'].toInt() as int,
      dimensions: Dimensions.fromMap(map['dimensions'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, brand: $brand, thumbnail: $thumbnail, weight: $weight, dimensions: $dimensions)';
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;
  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'depth': depth,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width'].toDouble() as double,
      height: map['height'].toDouble() as double,
      depth: map['depth'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Dimensions(width: $width, height: $height, depth: $depth)';
}
