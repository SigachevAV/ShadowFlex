import 'dart:convert';
import 'dart:math';
import 'package:shadow_flex/models/harm.dart';
import 'package:shadow_flex/models/harm_types.dart';
import 'package:shadow_flex/models/metatypes.dart';
import 'package:shadow_flex/models/shared_preference_manager.dart';

class HeroData {
  List<int> helth = [8, 0];
  List<int> stun = [8, 0];
  List<Harm> harms = List.empty(growable: true);
  Metatype metatype = Metatype.HUMAN;
  List abilites = List.generate(11,
      ((index) => List.generate(6, (index) => List.generate(7, (index) => 0))));
  Map<String, dynamic> generalInfo = Map();

  static final HeroData _instanse = HeroData._internal();

  factory HeroData() {
    return _instanse;
  }

  Future<bool> Load() {
    return SharedPreferenceManager().LoadHero();
  }

  HeroData._internal() {
    abilites[0][0][0] = 1;
    abilites[1][0][0] = 1;
    abilites[1][1][0] = 0;
    abilites[1][2][0] = 0;
    abilites[1][3][0] = -1;
    abilites[1][4][0] = 0;
    abilites[2][0][0] = 1;
    abilites[2][1][0] = 0;
    abilites[3][0][0] = 1;
    abilites[4][0][0] = 1;
    abilites[5][0][0] = 1;
    abilites[5][1][0] = -1;
    abilites[5][2][0] = -1;
    abilites[5][3][0] = 0;
    abilites[5][4][0] = 0;
    abilites[6][0][0] = 0;
    abilites[7][0][0] = 1;
    abilites[8][1][0] = -1;
    abilites[8][2][0] = -1;
    abilites[8][3][0] = -1;
    abilites[8][4][0] = -1;
    abilites[9][1][0] = -1;
    abilites[10][0][0] = 1;
    bool hasPrev = true;
    //Load().then((value) => {hasPrev = value});
    if (hasPrev == true) {
      return;
    }
    return;
  }

  List<int> indexParse(int _index) {
    int i = _index;
    List<int> result = List.empty(growable: true);
    if (_index == 0) {
      result.addAll([0, 0, 0]);
      return result;
    }
    while (i > 0) {
      result.add(i % 10);
      i = i ~/ 10;
    }
    if (result.length == 4) {
      result = [0, 0, 10];
    }
    result = result.reversed.toList();
    return result;
  }

  int GetAbility(int _index) {
    List<int> index = indexParse(_index);
    CheckBounce(index);
    return abilites[index[0]][index[1]][index[2]];
  }

  void CheckBounce(List<int> index) {
    if (index[0] > 10 || index[0] < 0 || index[1] < 0 || index[2] < 0) {
      throw Exception("Out of bounce");
    }
    switch (index[0]) {
      case 0:
      case 3:
      case 4:
      case 10:
        if (index[1] != 0 || index[2] != 0) {
          throw Exception("Out of bounce");
        }
        break;
      case 2:
      case 9:
        if (index[1] > 1 || index[2] > 3) {
          throw Exception("Out of bounce");
        }
        break;
      case 7:
        if (index[1] > 2) {
          throw Exception("Out of bounce");
        }
        switch (index[1]) {
          case 1:
            if (index[2] > 4) {
              throw Exception("Out of bounce");
            }
            break;
          case 2:
            if (index[2] > 5) {
              throw Exception("Out of bounce");
            }
            break;
          default:
            break;
        }
        break;
      case 6:
        if (index[1] > 2 || index[2] > 4) {
          throw Exception("Out of bounce");
        }
        break;
      case 5:
        if (index[1] > 4) {
          throw Exception("Out of bounce");
        }
        switch (index[1]) {
          case 1:
            if (index[2] > 4) {
              throw Exception("Out of bounce");
            }
            break;
          case 2:
            if (index[2] > 3) {
              throw Exception("Out of bounce");
            }
            break;
          case 3:
            if (index[2] > 2) {
              throw Exception("Out of bounce");
            }
            break;
          case 4:
            if (index[2] > 7) {
              throw Exception("Out of bounce");
            }
            break;
          default:
            break;
        }
        break;
      case 8:
        if (index[1] > 4) {
          throw Exception("Out of bounce");
        }
        switch (index[1]) {
          case 1:
            if (index[2] > 4) {
              throw Exception("Out of bounce");
            }
            break;
          case 2:
          case 3:
          case 4:
            if (index[2] > 3) {
              throw Exception("Out of bounce");
            }
            break;
          default:
            break;
        }
        break;
      case 2:
        if (index[1] > 5) {
          throw Exception("Out of bounce");
        }
        switch (index[1]) {
          case 1:
            if (index[2] > 6) {
              throw Exception("Out of bounce");
            }
            break;
          case 2:
          case 5:
            if (index[2] > 3) {
              throw Exception("Out of bounce");
            }
            break;
          case 3:
            if (index[2] != 0) {
              throw Exception("Out of bounce");
            }
            break;
          case 4:
            if (index[2] > 5) {
              throw Exception("Out of bounce");
            }
            break;
          default:
            throw Exception("Out of bounce");
        }
        break;
      default:
        break;
    }
  }

  void SetAbillyty(int _index, int _value) {
    if (_value > 6 || _value < 0) {
      throw Exception("Incorrect value");
    }
    List<int> index = indexParse(_index);
    CheckBounce(index);
    abilites[index[0]][index[1]][index[2]] = _value;
    if (index[0] == 0 || index[0] == 4) {
      UpdateStatusLimit(index[0]);
    }
    Write();
  }

  void UpdateStatusLimit(int _parentIndex) {
    num temp = 8;
    temp += (abilites[_parentIndex][0][0] ~/ 2);
    temp += (abilites[_parentIndex][0][0] % 2);
    switch (_parentIndex) {
      case 0:
        helth[0] = temp.toInt();
        break;
      case 4:
        stun[0] = temp.toInt();
        break;
      default:
        break;
    }
  }

  void Write() {
    SharedPreferenceManager().WriteHero();
  }

  List<int> Roll(int _index, int _mod) {
    num? pool = 0 + _mod;
    List<int> roll = List.empty(growable: true);
    int hits = 0;
    int ones = 0;
    List<int> index = indexParse(_index);
    CheckBounce(index);
    pool += abilites[index[0]][0][0];
    pool += CalcStatusMod();
    if (index[1] != 0) {
      pool += abilites[index[0]][index[1]][0];
    }
    if (index[2] != 0) {
      pool += abilites[index[0]][index[1]][index[2]];
    }
    if (pool <= 0) {
      roll.add(0);
      return roll;
    }
    roll.add(0);
    for (var i = 0; i < pool; i++) {
      int temp = Random().nextInt(5) + 1;
      if (temp > 4) {
        hits += 1;
      }
      if (temp == 1) {
        ones += 1;
      }
      roll.add(temp);
    }
    if (ones == pool ~/ 2 + 1) {
      roll[0] = -1;
    } else if (ones > pool ~/ 2 + 1) {
      roll[0] = -2;
    } else {
      roll[0] = hits;
    }
    return roll;
  }

  int CalcStatusMod() {
    int result = 0;
    result += (helth[1] ~/ 3);
    result += (stun[1] ~/ 3);
    result *= -1;
    return result;
  }

  void UpdateStatusValue() {
    helth[1] = 0;
    stun[1] = 0;

    harms.removeWhere((element) => (element.value == 0));

    for (var i = 0; i < harms.length; i++) {
      switch (harms[i].type) {
        case HarmTypes.HELTH:
          helth[1] += harms[i].value;
          break;
        case HarmTypes.STUN:
        case HarmTypes.EXOST:
          stun[1] += harms[i].value;
        default:
      }
    }
  }

  void AddHarm(HarmTypes _type, int _value) {
    harms.add(Harm(_type, _value));
  }

  void SetGeneralInfo(String _key, String _value) {
    if (!generalInfo.containsKey(_key)) {
      generalInfo.addAll({_key: _value});
      return;
    }
    generalInfo[_key] = _value;
    Write();
    return;
  }

  String GetGeneralInfo(String _key) {
    String result = '';
    if (!generalInfo.containsKey(_key)) {
      return result;
    }
    result = generalInfo[_key];
    return result;
  }

  Map<String, dynamic> toJson() {
    String harmsJson = jsonEncode(harms.map((e) => (e.toJson())).toList());

    return {
      'abilites': abilites,
      'metatype': metatype,
      'helth': helth,
      'stun': stun,
      'harms': harmsJson,
      'generalInfo': generalInfo
    };
  }

  HeroData.fromJson(Map<String, dynamic> json)
      : abilites = json['abilites'],
        metatype = json['metatype'],
        helth = json['helth'],
        stun = json['stun'],
        harms = json['harms'];
}
