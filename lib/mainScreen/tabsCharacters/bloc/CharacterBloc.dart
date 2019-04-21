import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/resources/CharacterRepository.dart';

class CharacterBloc{
  final repository = CharacterRepository();

  Future<List<CharacterModel>> fetchAllCharacters() async{
    List<CharacterModel> list = await repository.fetchAllCharacters();
    return list;
  }
}