import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:shadow_flex/models/metatypes.dart';
import 'package:shadow_flex/models/shared_preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeroData {
  List<int> helth = [8, 0];
  List<int> stun = [8, 0];
  Metatype metatype = Metatype.HUMAN;
  List abilites = List.generate(11,
      ((index) => List.generate(6, (index) => List.generate(7, (index) => 0))));

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
    dev.log(result.toString());
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
      UpdateStatus(index[0]);
    }
    Write();
  }

  void UpdateStatus(int _parentIndex) {
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

  Map<String, dynamic> toJson() => {
        'abilites': abilites,
        'metatype': metatype,
        'helth': helth,
        'stun': stun
      };
  HeroData.fromJson(Map<String, dynamic> json)
      : abilites = json['abilites'],
        metatype = json['metatype'],
        helth = json['helth'],
        stun = json['stun'];
}
