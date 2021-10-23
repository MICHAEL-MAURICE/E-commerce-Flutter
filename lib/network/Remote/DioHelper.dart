
import 'dart:convert';

import 'package:dio/dio.dart';
class Diohelper{

  static late Dio dio;

  static init(){

    dio=Dio(
        BaseOptions(
          baseUrl: "https://student.valuxapps.com/api/"
              ,receiveDataWhenStatusError: true,
          headers: {
            "Content-Type":"application/json"},

        )

    );
  }

  // ignore: non_constant_identifier_names
  static Future<Response> postdata (
      {
        required String url,
        Map<String,dynamic>?query,
        required Map<String,String>data,
        String lang = 'ar',
        String token=''

      }

      ){
    dio.options.headers={
      'lang':lang,
      'Authorization':token

    };
    return dio.post(url,

        queryParameters: query,
        data: data);


  }



    static Future<Response> getdata({
   required String url,
      Map<String,dynamic>?map,
       String lang = 'ar',
      String? token
 })async{
    dio.options.headers={
      'lang':lang,
      'Authorization':token

    };

     return await dio.get(url,queryParameters: map);

 }


}