class ComicItemModel{

  String resourceURI;
  String name;

  static const PARAM_RESOURCE_ID = "resourceURI";
  static const PARAM_NAME = "name";

  ComicItemModel.fromJson(Map json){
    this.resourceURI = json[PARAM_RESOURCE_ID];
    this.name = json[PARAM_NAME];
  }
}