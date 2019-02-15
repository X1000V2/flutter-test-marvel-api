import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/resources/ComicsRepository.dart';

class ComicsBloc{
  final repository = ComicsRepository();

  Future<List<ComicModel>> fetchAllComics() async{
    List<ComicModel> list = await repository.fetchAllComics();
    return list;
  }

  String getDescription(String description){
    String descriptionFormatted = "";
    descriptionFormatted = description != null ? description.length > 30 ? description.substring(0,30) : "":"";
    descriptionFormatted = descriptionFormatted.length > 0 ? (descriptionFormatted + "..."):"No description.";
    return descriptionFormatted;
  }
}