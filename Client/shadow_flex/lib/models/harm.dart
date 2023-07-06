import 'package:shadow_flex/models/harm_types.dart';

class Harm {
  HarmTypes type;
  int value;
  Harm(this.type, this.value);
  Map<String, dynamic> toJson() => {'type': this.type, 'value': this.value};
  Harm.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        value = json['value'];
}
