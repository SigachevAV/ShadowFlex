import 'dart:convert';

List<AdeptInfo> adeptFromJson(String str) =>
    List<AdeptInfo>.from(json.decode(str).map((x) => AdeptInfo.fromJson(x)));

String adeptToJson(List<AdeptInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdeptInfo {
  int id;
  String name;
  String cost;
  String activation;
  String description;

  AdeptInfo({
    this.id = -1,
    required this.name,
    this.cost = '',
    this.activation = '',
    this.description = '',
  });

  factory AdeptInfo.fromJson(Map<String, dynamic> json) => AdeptInfo(
        id: json['id'] ?? -1,
        name: json["name"],
        cost: json["cost"] ?? '',
        activation: json["activation"] ?? '',
        description: json["description"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "activation": activation,
        "description": description,
      };
}
