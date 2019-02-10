import 'package:flutter_test_marvel_api/common/Environments.dart';
import 'package:flutter_test_marvel_api/common/services/model/CharacterModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceManager {

  

  static Future<List<CharacterModel>> getCharactersFromService() async {

    Map<String, String> queryParameters = {
      Environments.PARAM_API_KEY: Environments.PARAM_API_KEY_VALUE,
      Environments.PARAM_HASH: Environments.PARAM_HASH_VALUE,
      Environments.PARAM_TS: Environments.PARAM_TS_VALUE,
      Environments.PARAM_LIMIT: Environments.PARAM_LIMIT_VALUE
    };

    final uriNew = new Uri.https(Environments.URL_BASE,
        Environments.SERVICE_CHARACTERS, queryParameters);
    var response = await http.get(uriNew);
    var jsonData = json.decode(response.body);

    //TODO: parse response
    List<CharacterModel> listCharacters = List();
    for(var character in jsonData["data"]["results"]){
      listCharacters.add(CharacterModel.fromJson(character));
    }

    return listCharacters;
  }
}
