import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_morty_flutter_app/data/dioHelper.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterDetails.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Characterprovider {
  var dio = Dio();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<CharacterList> getAllCharacters() async {
    Response characterListResponse = await dio.get(
        'https://rickandmortyapi.com/api/character/');
    return CharacterList.fromJsonMap(characterListResponse.data);
  }


  Future<CharacterDetails> getCharacterById(int id) async {
    Response characterDetailResponse = await dio.get(
        'https://rickandmortyapi.com/api/character/${id}');
    return CharacterDetails.fromJsonMap(characterDetailResponse.data);
  }
  Future<CharacterList> getDitto() async {
    var dio = Dio();
    
    Response dittoResponse = await dio.get('https://rickandmortyapi.com/api/character/');
  }


}