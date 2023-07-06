enum HarmTypes {
  HELTH,
  STUN,
  EXOST;

  String toJson() => name;
  static HarmTypes fromJson(String json) => values.byName(json);
}
