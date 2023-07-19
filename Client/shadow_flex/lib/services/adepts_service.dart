import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shadow_flex/models/api_constants.dart';
import 'package:shadow_flex/models/info_models/adept.dart';

class AdeptsService {
  Future<List<Adept>?> getAll() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.adeptsEndPoint).replace(queryParameters: {
        ApiConstants.langParam: ApiConstants.language
      });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Adept> _model = adeptFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Adept?> getById(int id) async {
    var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.adeptsEndPoint}/$id').replace(queryParameters: {
        ApiConstants.langParam: ApiConstants.language
      });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Adept _model = Adept.fromJson(jsonDecode(response.body));
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}