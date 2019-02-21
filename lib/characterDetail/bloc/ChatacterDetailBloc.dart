import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/resources/ComicsRepository.dart';

class ChatacterDetailBloc{

  final repository = ComicsRepository();

  Future<ComicModel> fetchComic(String url) => repository.fetchComic(url);
}