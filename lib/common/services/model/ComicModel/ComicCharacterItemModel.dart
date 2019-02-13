class ComicCharacterItemModel{
  String resourceURI;
  String name;

  static const PARAM_RESOURCE_URI = "resourceURI";
  static const PARAM_NAME = "name";

  ComicCharacterItemModel.fromJson(Map json){
    this.resourceURI = json[PARAM_RESOURCE_URI];
    this.name = json[PARAM_NAME];
  }
}