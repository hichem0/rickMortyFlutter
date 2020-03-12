
import 'package:rick_morty_flutter_app/data/model/CharacterDetails.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';
import 'package:rick_morty_flutter_app/data/provider/characterProvider.dart';

class CharacterRepository {

  Future<CharacterList>getAllCharacter() => Characterprovider().getAllCharacters();

  Future<CharacterDetails>getCharacterDetails(int id) => Characterprovider().getCharacterById(id);
}