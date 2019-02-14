import 'dart:convert';

import 'package:flutter_test_marvel_api/common/Environments.dart';
import 'package:flutter_test_marvel_api/common/services/ServicesInfo.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:http/http.dart' as http;

class ComicsApiProvider{

  Future<List<ComicModel>> getComicsFromService() async {

    Map<String, String> queryParameters = {
      ServicesInfo.PARAM_API_KEY: ServicesInfo.PARAM_API_KEY_VALUE,
      ServicesInfo.PARAM_HASH: ServicesInfo.PARAM_HASH_VALUE,
      ServicesInfo.PARAM_TS: ServicesInfo.PARAM_TS_VALUE,
      ServicesInfo.COMICS_PARAM_LIMIT: ServicesInfo.COMICS_PARAM_LIMIT_VALUE
    };

    final uriNew = new Uri.https(Environments.URL_BASE, ServicesInfo.SERVICE_COMICS, queryParameters);
    print("Service ${ServicesInfo.SERVICE_COMICS}: ${uriNew.toString()}");
    var response = await http.get(uriNew);
    var jsonData = json.decode(response.body);

    List<ComicModel> listComics = List();
    for(var character in jsonData["data"]["results"]){
      listComics.add(ComicModel.fromJson(character));
    }

    return listComics;
  }

}