import 'dart:convert';
import 'package:flutter_test_marvel_api/common/services/ServicesInfo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test_marvel_api/common/Environments.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';

class CharaterApiProvider{

  Future<List<CharacterModel>> getCharactersFromService() async {

    Map<String, String> queryParameters = {
      ServicesInfo.PARAM_API_KEY: ServicesInfo.PARAM_API_KEY_VALUE,
      ServicesInfo.PARAM_HASH: ServicesInfo.PARAM_HASH_VALUE,
      ServicesInfo.PARAM_TS: ServicesInfo.PARAM_TS_VALUE,
      ServicesInfo.PARAM_LIMIT: ServicesInfo.PARAM_LIMIT_VALUE
    };

    final uriNew = new Uri.https(Environments.URL_BASE,
        ServicesInfo.SERVICE_CHARACTERS, queryParameters);
    var response = await http.get(uriNew);
    var jsonData = json.decode(response.body);

    List<CharacterModel> listCharacters = List();
    for(var character in jsonData["data"]["results"]){
      listCharacters.add(CharacterModel.fromJson(character));
    }

    return listCharacters;
  }
}