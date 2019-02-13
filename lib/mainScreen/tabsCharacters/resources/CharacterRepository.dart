import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/resources/CharacterApiProvider.dart';

class CharacterRepository{
  final characterApiProvider = CharaterApiProvider();

  Future<List<CharacterModel>> fetchAllCharacters() => characterApiProvider.getCharactersFromService();
}