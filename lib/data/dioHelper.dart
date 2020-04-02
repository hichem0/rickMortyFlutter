import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rick_morty_flutter_app/data/appException.dart';


class DioHelper {
  Dio _dio;

  // fo singleton instance
  static final DioHelper _instance = DioHelper._privateConstructor();
  static DioHelper get instance => _instance;

  DioHelper._privateConstructor() {
    _dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api/character")); // il exsiste un param setTimeout dans BaseOptions


    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      compact: false
    ));

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      //SecureStorage
      /*if(token != null) {
        _dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer" + token;
      }*/
    }));
  }

  dynamic _returnResponse(Response response) {
    switch(response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data["Status"]);
    //
    }
  }

  // [] = param non obligatoire
  Future<dynamic> get(String route, [Map<String, dynamic> parameters]) async {
    var responseJson;
    try {
      final response = await _dio.get(route, queryParameters: parameters);
      responseJson = response.data;
    } on SocketException {
      debugPrint("no network");

    } on DioError catch (e) { // return que les messages http
      _returnResponse(e.response);
    }

    return responseJson;
  }

  Future<dynamic> post(String route, [dynamic data, Options options]) async {
    var responseJson;
    try {
      final response = await _dio.post(route, data: data, options: options);
      responseJson = response.data;
    } on SocketException {
      debugPrint("no network");

    } on DioError catch (e) { // return que les messages http
      _returnResponse(e.response);
    }

    return responseJson;
  }

  Future<dynamic> put(String route, [dynamic data, Options options]) async {
    var responseJson;
    try {
      final response = await _dio.put(route, data: data, options: options);
      responseJson = response.data;
    } on SocketException {
      debugPrint("no network");

    } on DioError catch (e) { // return que les messages http
      _returnResponse(e.response);
    }

    return responseJson;
  }
}
