// ignore_for_file: public_member_api_docs, sort_constructors_first
class DroprateResponse {
  final String? title;
  final String? imgUrl;
  final Attributes? attributes;

  DroprateResponse({
    this.title,
    this.imgUrl,
    this.attributes,
  });

  DroprateResponse copyWith({
    String? title,
    String? imgUrl,
    Attributes? attributes,
  }) {
    return DroprateResponse(
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      attributes: attributes ?? this.attributes,
    );
  }

  factory DroprateResponse.fromJson(Map<String, dynamic> json) {
    return DroprateResponse(
      title: json["title"],
      imgUrl: json["imgUrl"],
      attributes: json["attributes"] == null
          ? null
          : Attributes.fromJson(json["attributes"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "imgUrl": imgUrl,
        "attributes": attributes?.toJson(),
      };

  @override
  String toString() =>
      'DroprateResponse(title: $title, imgUrl: $imgUrl, attributes: $attributes)';
}

class Attributes {
  final num? height;
  final String? rarity;
  final num? price;

  Attributes({
    this.height,
    this.rarity,
    this.price,
  });

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
  String toString() =>
      'Attributes(height: $height, rarity: $rarity, price: $price)';
}
