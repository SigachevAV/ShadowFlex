import 'dart:convert';

List<Adept> adeptFromJson(String str) => List<Adept>.from(json.decode(str).map((x) => Adept.fromJson(x)));

String adeptToJson(List<Adept> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Adept {
    int id; 
    String name;
    String cost;
    String activation;
    String description;

    Adept({
        this.id = -1,
        required this.name,
        this.cost = '',
        this.activation = '',
        this.description = '',
    });

    factory Adept.fromJson(Map<String, dynamic> json) => Adept(
        id: json['id'] ?? '',
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
