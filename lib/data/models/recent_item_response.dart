class RecentItemResponse {
  RecentItemResponse({
    this.id,
    this.title,
    this.imgUrl,
    this.attributes,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? title;
  final String? imgUrl;
  final Attributes? attributes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RecentItemResponse copyWith({
    String? id,
    String? title,
    String? imgUrl,
    Attributes? attributes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RecentItemResponse(
      id: id ?? this.id,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      attributes: attributes ?? this.attributes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory RecentItemResponse.fromJson(Map<String, dynamic> json) {
    return RecentItemResponse(
      id: json["id"],
      title: json["title"],
      imgUrl: json["imgUrl"],
      attributes: json["attributes"] == null
          ? null
          : Attributes.fromJson(json["attributes"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imgUrl": imgUrl,
        "attributes": attributes?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $title, $imgUrl, $attributes, $createdAt, $updatedAt, ";
  }
}

class Attributes {
  Attributes({
    this.height,
    this.rarity,
    this.price,
  });

  final num? height;
  final String? rarity;
  final num? price;

  Attributes copyWith({
    num? height,
    String? rarity,
    num? price,
  }) {
    return Attributes(
      height: height ?? this.height,
      rarity: rarity ?? this.rarity,
      price: price ?? this.price,
    );
  }

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      height: json["height"],
      rarity: json["rarity"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "height": height,
        "rarity": rarity,
        "price": price,
      };

  @override
  String toString() {
    return "$height, $rarity, $price, ";
  }
}
