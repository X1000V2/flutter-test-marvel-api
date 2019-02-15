import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterComicsModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/EventsModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/StoriesModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/ThumbnailModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/UrlModel.dart';

class CharacterModel {
  int id;
  String name;
  String description;
  String modified;
  ThumbnailModel thumbnail;
  String resourceURI;
  CharacterComicsModel comics;
  StoriesModel stories;
  EventsModel events;
  List<UrlModel> urls;

  static const PARAM_ID = "id";
  static const PARAM_NAME = "name";
  static const PARAM_DESCRIPTION = "description";
  static const PARAM_MODIFIED = "modified";
  static const PARAM_THUMBNAIL = "thumbnail";
  static const PARAM_RESOURCE_URI = "resourceURI";
  static const PARAM_COMICS = "comics";
  static const PARAM_STORIES = "stories";
  static const PARAM_EVENTS = "events";
  static const PARAM_URLS = "urls";

  CharacterModel.fromJson(Map json){
    this.id = json[PARAM_ID];
    this.name = json[PARAM_NAME];
    this.description = json[PARAM_DESCRIPTION];
    this.thumbnail = ThumbnailModel.fromJson(json[PARAM_THUMBNAIL]);
    this.resourceURI = json[PARAM_RESOURCE_URI];
    this.comics = CharacterComicsModel.fromJson(json[PARAM_COMICS]);
    this.stories = StoriesModel.fromJson(json[PARAM_STORIES]);
    this.events = EventsModel.fromJson(json[PARAM_EVENTS]);

    this.urls = List();
    for(var url in json[PARAM_URLS]){
      this.urls.add(UrlModel.fromJson(url));
    }
  }
}
