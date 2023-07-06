enum Metatype {
  ORC,
  DWARF,
  HUMAN,
  ELVE,
  TROLL;

  String toJson() => name;
  static Metatype fromJson(String json) => values.byName(json);
}
