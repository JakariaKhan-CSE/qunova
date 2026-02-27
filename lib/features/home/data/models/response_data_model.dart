class BackendResModel {
  BackendResModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory BackendResModel.fromJson(Map<String, dynamic> json){
    return BackendResModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.categories,
    required this.contacts,
  });

  final List<Category> categories;
  final List<Contact> contacts;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
    );
  }

}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      name: json["name"],
    );
  }

}

class Contact {
  Contact({
    required this.id,
    required this.isEmpty,
    required this.name,
    required this.phone,
    required this.categoryId,
    required this.avatarUrl,
    required this.subtitle,
    required this.status,
    required this.createdAt,
  });

  final String? id;
  final bool? isEmpty;
  final String? name;
  final String? phone;
  final String? categoryId;
  final String? avatarUrl;
  final String? subtitle;
  final String? status;
  final DateTime? createdAt;

  factory Contact.fromJson(Map<String, dynamic> json){
    return Contact(
      id: json["id"],
      isEmpty: json["isEmpty"],
      name: json["name"],
      phone: json["phone"],
      categoryId: json["categoryId"],
      avatarUrl: json["avatarUrl"],
      subtitle: json["subtitle"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }

}
