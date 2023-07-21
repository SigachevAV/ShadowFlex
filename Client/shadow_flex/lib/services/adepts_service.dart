import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shadow_flex/services/api_constants.dart';
import 'package:shadow_flex/models/info_models/adept.dart';

class AdeptsService {
  Future<List<AdeptInfo>?> getAll() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.adeptsEndPoint)
        .replace(
            queryParameters: {ApiConstants.langParam: ApiConstants.language});
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AdeptInfo> _model = adeptFromJson(utf8.decode(response.bodyBytes));
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AdeptInfo?> getById(int id) async {
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.adeptsEndPoint}/$id')
            .replace(queryParameters: {
      ApiConstants.langParam: ApiConstants.language
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        AdeptInfo _model = AdeptInfo.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<AdeptInfo>?> getByName(String name) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.adeptsEndPoint + ApiConstants.searchRoute)
        .replace(
            queryParameters: {
              ApiConstants.langParam: ApiConstants.language,
              ApiConstants.nameParam: name
            });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AdeptInfo> _model = adeptFromJson(utf8.decode(response.bodyBytes));
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
