// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExtracModel {
  final int extractType;
  final String title;
  final String description;
  final String icon;
  final String price;
  ExtracModel({
    required this.extractType,
    required this.title,
    required this.description,
    required this.icon,
    required this.price,
  });

  ExtracModel copyWith({
    int? extractType,
    String? title,
    String? description,
    String? icon,
    String? price,
  }) {
    return ExtracModel(
      extractType: extractType ?? this.extractType,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'extractType': extractType,
      'title': title,
      'description': description,
      'icon': icon,
      'price': price,
    };
  }

  factory ExtracModel.fromMap(Map<String, dynamic> map) {
    return ExtracModel(
      extractType: map['extractType'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtracModel.fromJson(String source) => ExtracModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExtracModel(extractType: $extractType, title: $title, description: $description, icon: $icon, price: $price)';
  }

  @override
  bool operator ==(covariant ExtracModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.extractType == extractType &&
      other.title == title &&
      other.description == description &&
      other.icon == icon &&
      other.price == price;
  }

  @override
  int get hashCode {
    return extractType.hashCode ^
      title.hashCode ^
      description.hashCode ^
      icon.hashCode ^
      price.hashCode;
  }
}
