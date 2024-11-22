import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<String> get(String path) async {
    try {
      var response = await http.get(Uri.parse(path));
      return response.body;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getDio(String path) async {
    try {
      var response = await Dio().get(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future post(String path, {dynamic data}) async {
    try {
      var response = await http.post(
        Uri.parse(path), 
        body: jsonEncode(data),
        headers: {
          "content-type": "application/json"
        }
      );
      if (response.statusCode != 200) {
        throw response.reasonPhrase ?? "Something went wrong";
      }
      return response.body;
    } catch (e) {
      rethrow;
    }
  }

  Future postDio(String path, {dynamic data}) async {
    try {
      var response = await Dio().post(
        path, 
        data: data,
        options: Options(
          headers: {
            "content-type": "application/json"
          }
        ),
      );
      if (response.statusCode != 201) {
        throw response.statusMessage ?? "Something went wrong";
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteDio(String path) async {
    try {
      var response = await Dio().delete(
        path,
        options: Options(
          headers: {
            "content-type": "application/json"
          }
        ),
      );
      if (response.statusCode != 204) {
        throw response.statusMessage ?? "Something went wrong";
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}