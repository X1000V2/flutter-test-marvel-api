class ComicStoryItemModel{
  String resourceURI;
  String name;
  String type;

  static const PARAM_RESOURCE_URI = "resourceURI";
  static const PARAM_NAME = "name";
  static const PARAM_TYPE = "type";

  ComicStoryItemModel.fromJson(Map json){
    this.resourceURI = json[PARAM_RESOURCE_URI];
    this.name = json[PARAM_NAME];
    this.type = json[PARAM_TYPE];
  }
}