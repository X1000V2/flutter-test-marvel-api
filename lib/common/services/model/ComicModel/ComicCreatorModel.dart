import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicCreatorItemModel.dart';

class ComicCreatorModel{
  int available;
  String collectionURI;
  List<ComicCreatorItemModel> items;
  int returned;

  static const PARAM_AVAILABLE = "available";
  static const PARAM_COLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  ComicCreatorModel.fromJson(Map json){
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLECTION_URI];

    this.items = List();
    for(var item in json[PARAM_ITEMS]){
      this.items.add(ComicCreatorItemModel.fromJson(item));
    }

    this.returned = json[PARAM_RETURNED];
  }
}