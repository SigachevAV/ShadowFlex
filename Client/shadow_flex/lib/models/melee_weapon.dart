class MeleeWeapon {
  String name;
  String dF;
  String melee;
  MeleeWeapon(this.dF, this.melee, this.name);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dF': dF,
      'melee': melee,
    };
  }

  MeleeWeapon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dF = json['dF'],
        melee = json['melee'];
}
