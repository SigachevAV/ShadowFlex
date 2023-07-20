import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shadow_flex/services/api_constants.dart';
import 'package:shadow_flex/models/info_models/adept.dart';
import 'package:shadow_flex/models/info_models/matrix.dart';

class MatrixService {
  Future<Map<String, List<MatrixInfo>>?> getAll() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.matrixEndPoint)
        .replace(
            queryParameters: {ApiConstants.langParam: ApiConstants.language});
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return matrixInfoMapFromJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<MatrixInfo?> getById(int id) async {
    var url =
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.matrixEndPoint}/$id')
            .replace(queryParameters: {
      ApiConstants.langParam: ApiConstants.language
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return MatrixInfo.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Map<String, List<MatrixInfo>>?> getByName(String name) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.matrixEndPoint + ApiConstants.searchRoute)
        .replace(
            queryParameters: {
              ApiConstants.langParam: ApiConstants.language,
              ApiConstants.nameParam: name
            });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return matrixInfoMapFromJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
