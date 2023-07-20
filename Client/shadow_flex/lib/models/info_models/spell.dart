import 'dart:convert';

Map<String, List<SpellInfo>> spellInfoMapFromJson(String str) {
	var decoded = jsonDecode(str) as Map;
	Map<String, List<SpellInfo>> result = Map();
	List<SpellInfo> temp;
	for(var key in decoded.keys) {
    temp = List.empty(growable: true);
		for (var element in decoded[key]) {
			temp.add(SpellInfo.fromJson(element));
		}
		result[key] = temp;
	}
	return result;
}

String convertSpellCategory(String short) {
  String longCat;
  switch(short) {
    case "COM":
      longCat = "COMBAT";
      break;
    case "DET":
      longCat = "DETECTION";
      break;
    case "HEAL":
      longCat = "HEALTH";
      break;
    case "ILL":
      longCat = "ILLUSION";
      break;
    case "MAN": 
      longCat = "MANIPULTAION";
      break;
    default:
      longCat = "";
      break;
  }
  return longCat;
}

class SpellInfo {
    int id;
    String name;
    String category;
    String range;
    String duration;
    String type;
    int dv;
    String damage;
    String description;

    SpellInfo({
        this.id = -1,
        required this.name,
        this.category = '',
        this.range = '',
        this.duration = '',
        this.type = '',
        this.dv = -1,
        this.damage = '',
        this.description= '',
    });

    factory SpellInfo.fromJson(Map<String, dynamic> json) => SpellInfo(
        id: json["id"] ?? -1,
        name: json["name"] ?? '',
        category: json["category"] ?? '',
        range: json["range"] ?? '',
        duration: json["duration"] ?? '',
        type: json["type"] ?? '',
        dv: json["dv"] ?? -1,
        damage: json["damage"] ?? '',
        description: json["description"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "range": range,
        "duration": duration,
        "type": type,
        "dv": dv,
        "damage": damage,
        "description": description,
    };
}
