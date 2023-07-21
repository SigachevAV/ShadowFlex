class Trait {
  String trait;
  int karma;
  Trait(this.karma, this.trait);
  Map<String, dynamic> toJson() => {'trait': trait, 'karma': karma};
  Trait.fromJson(Map<String, dynamic> json)
      : trait = (json['trait']),
        karma = json['karma'];
}
