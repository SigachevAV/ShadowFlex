import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shadow_flex/models/info_models/spell.dart';
import 'package:shadow_flex/services/api_constants.dart';

class SpellsService {
  Future<Map<String, List<SpellInfo>>?> getAll() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.spellsEndPoint)
        .replace(
            queryParameters: {ApiConstants.langParam: ApiConstants.language});
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return spellInfoMapFromJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<SpellInfo?> getById(int id) async {
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.spellsEndPoint}/$id')
            .replace(queryParameters: {
      ApiConstants.langParam: ApiConstants.language
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return SpellInfo.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Map<String, List<SpellInfo>>?> getByName(String name) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.spellsEndPoint + ApiConstants.searchRoute)
        .replace(
            queryParameters: {
              ApiConstants.langParam: ApiConstants.language,
              ApiConstants.nameParam: name
            });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return spellInfoMapFromJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
