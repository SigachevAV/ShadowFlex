import 'dart:collection';
import 'dart:convert';

List<MatrixInfo> _matrixInfoListFromJson(String str) =>
    List<MatrixInfo>.from(json.decode(str).map((x) => MatrixInfo.fromJson(x)));

Map<String, List<MatrixInfo>> func(String str) {
  var decoded = jsonDecode(str) as Map;
  Map<String, List<MatrixInfo>> result = Map();
  List<MatrixInfo> temp = List.empty(growable: true);
  for (var element in decoded["MAJOR"]) {
    temp.add(MatrixInfo.fromJson(element));
  }
  result["MAJOR"] = temp;
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
        "name": name,
        "access": access,
        "legal": legal,
        "check": check,
        "description": description,
        "type": type,
    };
}