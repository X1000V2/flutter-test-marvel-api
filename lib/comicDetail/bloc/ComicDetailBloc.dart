import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/resources/CharacterRepository.dart';

class ComicDetailBloc{

  final repository = CharacterRepository();

  Future<CharacterModel> fetchCharacter(String url) async{
    CharacterModel character = await repository.fetchCharacter(url);
    return character;
  }
}