
import 'dart:convert';

import 'package:dio/dio.dart';
class Diohelper{

  static late Dio dio;

  static init(){

    dio=Dio(
        BaseOptions(
          baseUrl: "https://newsapi.org/"
              ,receiveDataWhenStatusError: true
        )

    );
  }

   static Future<Response> getdata({
  required String url,
    required Map<String,dynamic>map
})async{

    return await dio.get(url,queryParameters: map);

  }
}