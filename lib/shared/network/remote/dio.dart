import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData({
    required String path,
     Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio?.options.headers ={
    'lang':lang,
    'Content-Type':'application/json',
    'Authorization' : token??'',
  };
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String path,
      Map<String, dynamic>? query,
    required Map<String , dynamic> data,
    String lang = 'en',
    String? Authorization,
  }) async
  {
    dio?.options.headers ={
          'lang':lang,
          'Content-Type':'application/json',
          'Authorization' : Authorization??'',
        };

    return await dio!.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

}

