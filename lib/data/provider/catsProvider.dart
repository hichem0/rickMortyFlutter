import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_morty_flutter_app/data/model/Cat.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:rick_morty_flutter_app/data/dioHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatsProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Response> getCats() async {
    var dio = Dio();
    dio.options.headers["x-api-key"] = "27b68cc2-2a27-40fa-a6f2-c115e8bd599d";
    Response catsResponse =
        await dio.get("https://api.thecatapi.com/v1/images/search?limit=10");
    return catsResponse;
  }

//  Future<Response> getCats2() async{
//      DioHelper dioHelper = DioHelper.instance;
//      final resp = await dioHelper.get('/images');
//      var test = jsonDecode(resp);
//      return Cat.fromJson(test);
//  }
}
