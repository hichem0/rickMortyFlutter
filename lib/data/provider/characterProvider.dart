import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_morty_flutter_app/data/dioHelper.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterDetails.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Characterprovider {
  var dio = Dio();

    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<CharacterList> getAllCharacters() async {
    Response characterListResponse = await dio.get('https://rickandmortyapi.com/api/character/');
    return CharacterList.fromJsonMap(characterListResponse.data);
  }

  Future<CharacterDetails> getCharacterById(int id) async {
    Response characterDetailResponse =  await dio.get('https://rickandmortyapi.com/api/character/${id}');
    return CharacterDetails.fromJsonMap(characterDetailResponse.data);
  }

  Future<CharacterDetails> getCharacter() async {
    DioHelper dioHelper = DioHelper.instance;
    final resp = await dioHelper.get("/361");
    var test = jsonDecode(resp);
    return CharacterDetails.fromJsonMap(test);
  }
}