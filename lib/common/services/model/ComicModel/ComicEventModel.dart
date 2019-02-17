import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicEcentItemModel.dart';

class ComicEventModel {
  int available;
  String collectionURI;
  List<ComicEcentItemModel> items;
  int returned;

  static const PARAM_AVAILABLE = "returned";
  static const PARAM_COLLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  ComicEventModel.fromJson(Map json) {
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLLECTION_URI];

    //TODO not active parse because no data to know to deserialize yet
    //this.items = List();
    //for (var eventitem in json[PARAM_ITEMS]) {
    //  this.items.add(ComicEcentItemModel.fromJson(eventitem));
    //}

    this.returned = json[PARAM_RETURNED];
  }
}
