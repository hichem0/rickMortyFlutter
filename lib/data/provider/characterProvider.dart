import 'package:dio/dio.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterDetails.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';

class Characterprovider {
  var dio = Dio();

  Future<CharacterList> getAllCharacters() async {
    Response characterListResponse = await dio.get('https://rickandmortyapi.com/api/character/');
    return CharacterList.fromJsonMap(characterListResponse.data);
  }

  Future<CharacterDetails> getCharacterById(int id) async {
    Response characterDetailResponse =  await dio.get('https://rickandmortyapi.com/api/character/${id}');
    return CharacterDetails.fromJsonMap(characterDetailResponse.data);
  }
}