class RecentItemResponse {
  RecentItemResponse({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.recentId,
    this.fishId,
    this.title,
    this.imgUrl,
    this.height,
    this.rarity,
    this.price,
    this.userAddress,
    this.addedToCollection,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final String? recentId;
  final num? fishId;
  final String? title;
  final String? imgUrl;
  final num? height;
  final String? rarity;
  final num? price;
  final String? userAddress;
  final bool? addedToCollection;

  RecentItemResponse copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? recentId,
    num? fishId,
    String? title,
    String? imgUrl,
    num? height,
    String? rarity,
    num? price,
    String? userAddress,
    bool? addedToCollection,
  }) {
    return RecentItemResponse(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      recentId: recentId ?? this.recentId,
      fishId: fishId ?? this.fishId,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      height: height ?? this.height,
      rarity: rarity ?? this.rarity,
      price: price ?? this.price,
      userAddress: userAddress ?? this.userAddress,
      addedToCollection: addedToCollection ?? this.addedToCollection,
    );
  }

  factory RecentItemResponse.fromJson(Map<String, dynamic> json) {
    return RecentItemResponse(
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      id: json["id"],
      recentId: json["recentId"],
      fishId: json["fishId"],
      title: json["title"],
      imgUrl: json["imgUrl"],
      height: json["height"],
      rarity: json["rarity"],
      price: json["price"],
      userAddress: json["userAddress"],
      addedToCollection: json["addedToCollection"],
    );
  }

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "recentId": recentId,
        "fishId": fishId,
        "title": title,
        "imgUrl": imgUrl,
        "height": height,
        "rarity": rarity,
        "price": price,
        "userAddress": userAddress,
        "addedToCollection": addedToCollection,
      };

  @override
  String toString() {
    return "$createdAt, $updatedAt, $id, $recentId, $fishId, $title, $imgUrl, $height, $rarity, $price, $userAddress, $addedToCollection, ";
  }
}
