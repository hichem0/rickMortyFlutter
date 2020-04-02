import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rick_morty_flutter_app/data/appException.dart';

class DioHelper {
  Dio _dio;

  static final DioHelper _instance = DioHelper._privateConstructor();

  static DioHelper get instance => _instance;

  DioHelper._privateConstructor() {
    _dio =
        Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api/character/"));

    _dio.interceptors.add(PrettyDioLogger(
      responseHeader: true,
      requestBody: true,
      responseBody: true,
      compact: true,
    ));

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) {
//      //secureStorage
//
//      if(token != null) {
//        _dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer" + token
//      }
    }));
  }
    dynamic _returnResponse(Response response) {
      switch (response.statusCode) {
        case 200:
          return response.data;
        case 400 :
          return BadRequestException(response.data['status']);
      }
    }

    Future<dynamic> get(String route, [Map<String, dynamic> parameters]) async {
      var responseJson;
      try {
        final response = await _dio.get(route, queryParameters: parameters);
      } on SocketException {
        print('no Network');
      } on DioError catch (e) {
        _returnResponse(e.response);
      }
      return responseJson;
    }
    Future<dynamic> post(String route, [dynamic data, Options options]) async {
      var responseJson;
      try {
        final response = await _dio.post(route, data: data, options :options);
        responseJson = response.data;
      } on SocketException {
        print('no Network');
      } on DioError catch (e) {
        _returnResponse(e.response);
      }
      return responseJson;
    }
    Future<dynamic> put(String route, [dynamic data, Options options]) async {
      var responseJson;
      try {
        final response = await _dio.put(route, data: data, options :options);
        responseJson = response.data;
      } on SocketException {
        print('no Network');
      } on DioError catch (e) {
        _returnResponse(e.response);
      }
      return responseJson;
    }

  }

