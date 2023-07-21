class Spell {
  String name;
  String type;
  String distance;
  String duration;
  String exhaust;
  Spell(this.name, this.type, this.distance, this.duration, this.exhaust);
  Map<String, dynamic> toJson() =>
      {'name': name, 'type': type, 'distance': distance, 'duration': duration, 'exhaust': exhaust};
  Spell.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'],
        distance = json['distance'],
        duration = json['duration'],
        exhaust = json['exhaust'];
}