import 'package:flutter_test_marvel_api/common/services/model/ComicItemModel.dart';

class ComicsModel{
  int available;
  String collectionURI;
  List<ComicItemModel> items;
  int returned;


  static const PARAM_AVAILABLE = "available";
  static const PARAM_COLLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  ComicsModel.fromJson(Map json){
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLLECTION_URI];
    
    this.items = List();
    for(var comic in json[PARAM_ITEMS]){
      this.items.add(ComicItemModel.fromJson(comic));
    }

    this.returned = json[PARAM_RETURNED];

  }
}