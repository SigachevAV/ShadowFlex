import 'dart:convert';

Map<String, List<MatrixInfo>> matrixInfoMapFromJson(String str) {
	var decoded = jsonDecode(str) as Map;
	Map<String, List<MatrixInfo>> result = Map();
	List<MatrixInfo> temp;
	for(var key in decoded.keys) {
    temp = List.empty(growable: true);
		for (var element in decoded[key]) {
			temp.add(MatrixInfo.fromJson(element));
		}
		result[key] = temp;
	}
	return result;
}

class MatrixInfo {
    int id;
    String name;
    String access;
    String legal;
    String check;
    String description;
    String type;

    MatrixInfo({
        this.id = -1,
        required this.name,
        this.access = '',
        this.legal = '',
        this.check = '',
        this.description = '',
        this.type = '',
    });

    factory MatrixInfo.fromJson(Map<String, dynamic> json) => MatrixInfo(
        id: json["id"] ?? -1,
        name: json["name"],
        access: json["access"] ?? '',
        legal: json["legal"] ?? '',
        check: json["check"] ?? '',
        description: json["description"] ?? '',
        type: json["type"] ?? '',
    );

    Map<String, dynamic> toJson() => {
		"id": id,
        "name": name,
        "access": access,
        "legal": legal,
        "check": check,
        "description": description,
        "type": type,
    };
}