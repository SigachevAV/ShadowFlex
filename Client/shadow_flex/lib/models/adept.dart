class Adept {
  String name;
  String level;
  String note;
  Adept(this.name, this.level, this.note);
  Map<String, dynamic> toJson() =>
      {'name': name, 'level': level, 'note': note};
  Adept.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        level = json['level'],
        note = json['note'];
}