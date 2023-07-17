class Weapon {
  String name;
  String dF;
  String ammo;
  String atackRait;
  String rS;
  Weapon(this.ammo, this.dF, this.atackRait, this.name, this.rS);
  Map<String, dynamic> toJson() {
    return {
      'ammo': ammo,
      'dF': dF,
      'name': name,
      'atackRait': atackRait,
      'rS': rS
    };
  }

  Weapon.fromJson(Map<String, dynamic> json)
      : ammo = json['ammo'],
        dF = json['dF'],
        name = json['name'],
        atackRait = json['atackRait'],
        rS = json['rS'];
}
