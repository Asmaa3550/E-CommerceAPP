import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Map> getData(
      {@required String url, String token, String lang}) async {
    Map data;

    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? null
    };
    await _dio.get(url).then((value) {
      data = json.decode(value.toString());
    }).catchError((error) {
      print(error);
    });
    return data;
  }

  static Future<Map> postData({
      @required String url,
      Map<String, dynamic> query,
      String lang = 'en',
      String token ,
      @required Map<String, dynamic> data
      }) async {

    Map userData;
    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? null
    };
    await _dio.post(url, data: data).then((value) {
      userData = json.decode(value.toString());
    }).catchError((error) => print(error.toString()));

    return userData;
  }

  static Future<Map> putData(
      {@required String url,
        Map<String, dynamic> query,
        String lang = 'en',
        String token,
        @required Map<String, dynamic> data
      }) async {

    Map userData;
    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token
    };
    await _dio.put(url, data: data).then((value) {
      userData = json.decode(value.toString());
    }).catchError((error) => print(error.toString()));

    return userData;
  }
}
