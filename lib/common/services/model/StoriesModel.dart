import 'package:flutter_test_marvel_api/common/services/model/StoriesItemModel.dart';

class StoriesModel{
  int available;
  String collectionURI;
  List<StoriesItemModel> items;
  int returned;

  static const PARAM_AVAILABLE = "available";
  static const PARAM_COLLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  StoriesModel.fromJson(Map json){
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLLECTION_URI];

    this.items = List();
    for(var storyItem in json[PARAM_ITEMS]){
      this.items.add(StoriesItemModel.fromJson(storyItem));
    }

    this.returned = json[PARAM_RETURNED];
  }
}