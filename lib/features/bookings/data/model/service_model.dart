import 'dart:convert';

class ServiceModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int categoryId;
  final String categoryName;
  final bool enabled;
  final bool package;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.categoryName,
    required this.enabled,
    required this.package,
  });

  ServiceModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categoryId,
    String? categoryName,
    bool? enabled,
    bool? package,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      enabled: enabled ?? this.enabled,
      package: package ?? this.package,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'enabled': enabled,
      'package': package,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      categoryId: map['categoryId'] as int,
      categoryName: map['categoryName'] as String,
      enabled: map['enabled'] as bool,
      package: map['package'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(dynamic source) {
    if (source is String) {
      return ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
    }
    return ServiceModel.fromMap(source as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'ServiceModel(id: $id, name: $name, description: $description, price: $price, categoryId: $categoryId, categoryName: $categoryName, enabled: $enabled, package: $package)';
  }

  @override
  bool operator ==(covariant ServiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.enabled == enabled &&
        other.package == package;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        categoryId.hashCode ^
        categoryName.hashCode ^
        enabled.hashCode ^
        package.hashCode;
  }
}
