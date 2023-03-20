// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Categories {
  String? name;
  String? image;
  Categories({
    this.name,
    this.image,
  });

  Categories copyWith({
    String? name,
    String? image,
  }) {
    return Categories(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) => Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categories(name: $name, image: $image)';

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
