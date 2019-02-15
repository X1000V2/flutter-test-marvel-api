import 'package:flutter_test_marvel_api/common/services/model/characterModels/SeriesItemModel.dart';

class SeriesModel{
  int available;
  String collectionURI;
  List<SeriesItemModel> items;
  int returned;

  static const PARAM_AVAILABLE = "available";
  static const PARAM_COLLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  SeriesModel.fromJson(Map json){
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLLECTION_URI];

    this.items = List();
    for(var serie in json[PARAM_ITEMS]){
      this.items.add(SeriesItemModel.fromJson(serie));
    }

    this.returned = json[PARAM_RETURNED];
  }
}