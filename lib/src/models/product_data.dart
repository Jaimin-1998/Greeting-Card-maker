// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String status;
    List<Datum> data;

    Product({
        this.status,
        this.data,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String categoryName;
    String categoryImg;
    String isAvailable;

    Datum({
        this.id,
        this.categoryName,
        this.categoryImg,
        this.isAvailable,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        categoryImg: json["category_img"] == null ? null : json["category_img"],
        isAvailable: json["is_available"] == null ? null : json["is_available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category_name": categoryName == null ? null : categoryName,
        "category_img": categoryImg == null ? null : categoryImg,
        "is_available": isAvailable == null ? null : isAvailable,
    };
}
