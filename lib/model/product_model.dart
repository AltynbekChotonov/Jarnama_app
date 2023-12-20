import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final List<String>? images;
  final String title;
  final String description;
  final String dateTime;
  final String phoneNumber;
  final String userName;
  final String address;
  final String? pris;
  Product({
    this.images,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.phoneNumber,
    required this.userName,
    required this.address,
    this.pris,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'images': images,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'address': address,
      'pris': pris,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<String>))
          : null,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: map['dateTime'] as String,
      phoneNumber: map['phoneNumber'] as String,
      userName: map['userName'] as String,
      address: map['address'] as String,
      pris: map['pris'] != null ? map['pris'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
