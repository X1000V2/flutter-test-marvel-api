import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/resources/ComicsApiProvider.dart';

class ComicsRepository{
  final characterApiProvider = ComicsApiProvider();

  Future<List<ComicModel>> fetchAllComics() => characterApiProvider.getComicsFromService();
}