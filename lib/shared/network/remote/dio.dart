import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'lang':'en'
          },
        )
    );
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic> query,
  }) async
  {
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
    required String path,
      Map<String, dynamic>? query,
    required Map<String , dynamic> data,
    String lang = 'ar',
    String? Authorization,
  }) async
  {
    dio?.options.headers ={
          'lang':lang,
          'Authorization' : Authorization,
        };

    return await dio!.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

}

