class Armor {
  String name;
  String rating;
  String effect;
  Armor(this.name, this.rating, this.effect);
  Map<String, dynamic> toJson() =>
      {'name': name, 'rating': rating, 'effect': effect};
  Armor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        rating = json['rating'],
        effect = json['effect'];
}