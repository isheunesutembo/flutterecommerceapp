// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class Product {
  String productId;
  String image;
  String name;

  double price;
  double? oldprice;
  bool? isAvailable;
  String description;
  String? categoryname;
  Product({
    required this.productId,
    required this.image,
    required this.name,
    required this.price,
    this.oldprice,
     this.isAvailable,
    required this.description,
    this.categoryname,
  });

  Product copyWith({
    String? productId,
    String? image,
    String? name,
    double? price,
    double? oldprice,
    bool? isAvailable,
    String? description,
    String? categoryname,
  }) {
    return Product(
      productId: productId ?? this.productId,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      oldprice: oldprice ?? this.oldprice,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
      categoryname: categoryname ?? this.categoryname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'image': image,
      'name': name,
      'price': price,
      'oldprice': oldprice,
      'isAvailable': isAvailable,
      'description': description,
      'categoryname': categoryname,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] as String,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      oldprice: map['oldprice'] != null ? map['oldprice'] as double : null,
      isAvailable: map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      description: map['description'] as String,
      categoryname: map['categoryname'] != null ? map['categoryname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(productId: $productId, image: $image, name: $name, price: $price, oldprice: $oldprice, isAvailable: $isAvailable, description: $description, categoryname: $categoryname)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.productId == productId &&
      other.image == image &&
      other.name == name &&
      other.price == price &&
      other.oldprice == oldprice &&
      other.isAvailable == isAvailable &&
      other.description == description &&
      other.categoryname == categoryname;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      image.hashCode ^
      name.hashCode ^
      price.hashCode ^
      oldprice.hashCode ^
      isAvailable.hashCode ^
      description.hashCode ^
      categoryname.hashCode;
  }
}
