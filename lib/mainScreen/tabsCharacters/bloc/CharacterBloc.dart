import 'package:flutter_test_marvel_api/common/services/model/CharacterModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/resources/CharacterRepository.dart';

class CharacterBloc{
  final repository = CharacterRepository();

  Future<List<CharacterModel>> fetchAllCharacters() async{
    List<CharacterModel> list = await repository.fetchAllCharacters();
    return list;
  }

  String getDescription(String description){
    String descriptionFormatted = "";
    descriptionFormatted = description.length > 30 ? description.substring(0,30) : "";
    descriptionFormatted = descriptionFormatted.length > 0 ? (descriptionFormatted + "..."):"No description.";
    return descriptionFormatted;
  }
}