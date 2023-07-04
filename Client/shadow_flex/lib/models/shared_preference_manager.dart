import 'dart:convert';
import 'dart:developer' as dev;
import 'package:shadow_flex/models/hero.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  Future<void> WriteHero() async {
    dev.log("writing");
    HeroData hero = HeroData();
    String json = jsonEncode(hero);
    SharedPreferences preferences = await _preferences;
    preferences.setString('hero', json);
  }

  Future<bool> LoadHero() async {
    HeroData hero = HeroData();
    dev.log("loading");
    SharedPreferences preferences = await _preferences;
    if ((preferences.getString('hero')) != null) {
      String? jsonStr;
      jsonStr = preferences.getString('hero');
      Map<String, dynamic> json = jsonDecode(jsonStr!);
      hero.abilites = json['abilites'];
      return true;
    }
    return false;
  }
}