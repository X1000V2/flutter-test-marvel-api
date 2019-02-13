import 'package:flutter_test_marvel_api/common/services/model/characterModels/EventItemModel.dart';

class EventsModel{
  int available;
  String collectionURI;
  List<EventItemModel> items;
  int returned;

  static const PARAM_AVAILABLE = "available";
  static const PARAM_COLLECTION_URI = "collectionURI";
  static const PARAM_ITEMS = "items";
  static const PARAM_RETURNED = "returned";

  EventsModel.fromJson(Map json){
    this.available = json[PARAM_AVAILABLE];
    this.collectionURI = json[PARAM_COLLECTION_URI];

    this.items = List();
    for(var eventItem in json[PARAM_ITEMS]){
      this.items.add(EventItemModel.fromJson(eventItem));
    }

    this.returned = json[PARAM_RETURNED];
  }
}