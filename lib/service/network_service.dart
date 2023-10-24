import 'dart:convert';

import 'package:find_work/data/local_data_source.dart';
import 'package:find_work/model/resume.dart';
import 'package:find_work/model/vacancy.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
sealed class Network {
  static const baseUrl = "jobhuntly.pythonanywhere.com";

  static const apiProfile = "/users/auth/profile/";

  static const apiVacancyCreate = "/vacancy/create";
  static const apiVacancyList = "/vacancy/list";
  static const apiResumeCreate = "/resume/create";
  static const apiResumeEducationCreate = "/resume/educations/create";
  static const apiResumeExperienceCreate = "/resume/experience/create";
  static const apiResumeList = "/resume/list";

  static Future<String?> methodGet({required String api, Object? id, String baseUrl = baseUrl}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await http.get(url);
      if(response.statusCode == 200) {
        // return response.body;
        return utf8.decoder.convert(response.bodyBytes);
      }
    } catch(e) {
      return null;
    }
    return null;
  }

  static Future<void> methodDelete({required String api, required Object id, String baseUrl = baseUrl}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api/$id");
      final response = await http.delete(url);
      if(response.statusCode == 200) {
        debugPrint(response.body);
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> methodPost({required String api, String baseUrl = baseUrl, required Map<String, Object?> data}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.post(url, body: jsonEncode(data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> methodPut({required String api, required Object id, String baseUrl = baseUrl, required Map<String, Object?> data}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api/$id");
      final response = await http.put(url, body: jsonEncode(data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  static List<ResumeModel> parseResumeList(String data) {
    final json = jsonDecode(data) as List; /// String => json(Map, List, ...)
    return json.map((item) => ResumeModel.fromJson(item)).toList(); /// json => object
  }

  static List<VacancyModel> parseVacancyList(String data) {
    final json = jsonDecode(data) as List; /// String => json(Map, List, ...)
    return json.map((item) => VacancyModel.fromJson(item)).toList(); /// json => object
  }

  static ResumeModel parseResume(String data) {
    final json = jsonDecode(data);
    final resume = ResumeModel.fromJson(json);
    return resume;
  }

  static VacancyModel parseVacancy(String data) {
    final json = jsonDecode(data);
    final vacancy = VacancyModel.fromJson(json);
    return vacancy;
  }



}