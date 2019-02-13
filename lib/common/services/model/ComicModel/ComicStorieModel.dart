import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicStoryItemModel.dart';

class ComicStorieModel{
  int available;
  String collectionURI;
  List<ComicStoryItemModel> items;
  int returned;

  static const PARAM_AVAILABLE = "available";
  static const PARAM_COLLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  ComicStorieModel.fromJson(Map json){
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLLECTION_URI];
    
    this.items = List();
    for(var item in json[PARAM_ITEMS]){
      this.items.add(ComicStoryItemModel.fromJson(item));
    }

    this.returned = json[PARAM_RETURNED];
  }
}