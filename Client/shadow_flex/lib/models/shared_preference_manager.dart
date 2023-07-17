import 'dart:convert';
import 'dart:developer' as dev;
import 'package:shadow_flex/models/adept.dart';
import 'package:shadow_flex/models/connections.dart';
import 'package:shadow_flex/models/harm.dart';
import 'package:shadow_flex/models/hero.dart';
import 'package:shadow_flex/models/metatypes.dart';
import 'package:shadow_flex/models/spell.dart';
import 'package:shadow_flex/models/trait.dart';
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
      if (json['helth'] != null) {
        hero.helth = List<int>.from(json['helth']);
      }
      if (json['stun'] != null) {
        hero.stun = List<int>.from(json['stun']);
      }
      if (json['metatype'] != null) {
        hero.metatype = Metatype.fromJson(json['metatype']);
      }
      if (json['harms'] != null) {
        var temp = List<Map<String, dynamic>>.from(jsonDecode(json['harms']));
        hero.harms = List.empty(growable: true);
        for (var element in temp) {
          hero.harms.add(Harm.fromJson(element));
        }
      }
      if (json['generalInfo'] != null) {
        hero.generalInfo = json['generalInfo'];
      }
      if (json['traits'] != null) {
        var temp = List<Map<String, dynamic>>.from(jsonDecode(json['traits']));
        hero.traits = List<Trait>.empty(growable: true);
        for (var element in temp) {
          hero.traits.add(Trait.fromJson(element));
        }
      }
      if (json['connections'] != null) {
        var temp =
            List<Map<String, dynamic>>.from(jsonDecode(json['connections']));
        hero.connections = List<Connection>.empty(growable: true);
        for (var element in temp) {
          hero.connections.add(Connection.fromJson(element));
        }
      }
      if (json['spells'] != null) {
        var temp =
            List<Map<String, dynamic>>.from(jsonDecode(json['spells']));
        hero.spells = List<Spell>.empty(growable: true);
        for (var element in temp) {
          hero.spells.add(Spell.fromJson(element));
        }
      }
      if (json['adepts'] != null) {
        var temp =
            List<Map<String, dynamic>>.from(jsonDecode(json['adepts']));
        hero.adepts = List<Adept>.empty(growable: true);
        for (var element in temp) {
          hero.adepts.add(Adept.fromJson(element));
        }
      }
      if (json['programs'] != null) {
        var temp = jsonDecode(json['programs']);
        hero.programs = List<String>.from(temp);
      }
      return true;
    }
    return false;
  }
}
