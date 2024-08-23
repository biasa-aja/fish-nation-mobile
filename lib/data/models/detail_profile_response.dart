class DetailProfileResponse {
  DetailProfileResponse({
    this.level,
    this.energy,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.username,
    this.address,
    this.accessToken,
  });

  final num? level;
  final num? energy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? id;
  final String? username;
  final String? address;
  final String? accessToken;

  DetailProfileResponse copyWith({
    num? level,
    num? energy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? username,
    String? address,
    String? accessToken,
  }) {
    return DetailProfileResponse(
      level: level ?? this.level,
      energy: energy ?? this.energy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      username: username ?? this.username,
      address: address ?? this.address,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  factory DetailProfileResponse.fromJson(Map<String, dynamic> json) {
    return DetailProfileResponse(
      level: json["level"],
      energy: json["energy"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      id: json["id"],
      username: json["username"],
      address: json["address"],
      accessToken: json["accessToken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "level": level,
        "energy": energy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "username": username,
        "address": address,
        "accessToken": accessToken,
      };

  @override
  String toString() {
    return "$level, $energy, $createdAt, $updatedAt, $id, $username, $address, $accessToken, ";
  }
}
