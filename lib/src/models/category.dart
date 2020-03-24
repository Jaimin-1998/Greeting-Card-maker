// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    String status;
    List<Datum> data;

    Data({
        this.status,
        this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    String imgName;
    String imgUrl;
    String imgUrlJpg;
    String categoryId;
    String isAvailable;

    Datum({
        this.id,
        this.imgName,
        this.imgUrl,
        this.imgUrlJpg,
        this.categoryId,
        this.isAvailable,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        imgName: json["img_name"] == null ? null : json["img_name"],
        imgUrl: json["img_url"] == null ? null : json["img_url"],
        imgUrlJpg: json["img_url_jpg"] == null ? null : json["img_url_jpg"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        isAvailable: json["is_available"] == null ? null : json["is_available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "img_name": imgName == null ? null : imgName,
        "img_url": imgUrl == null ? null : imgUrl,
        "img_url_jpg": imgUrlJpg == null ? null : imgUrlJpg,
        "category_id": categoryId == null ? null : categoryId,
        "is_available": isAvailable == null ? null : isAvailable,
    };
}
