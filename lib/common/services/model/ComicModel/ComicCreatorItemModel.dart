class ComicCreatorItemModel{
  String resourceURI;
  String name;
  String role;

  static const PARAM_RESOURCE_URI = "resourceURI";
  static const PARAM_NAME = "name";
  static const PARAM_ROLE = "role";

  ComicCreatorItemModel.fromJson(Map json){
    this.resourceURI = json[PARAM_RESOURCE_URI];
    this.name = json[PARAM_NAME];
    this.role = json[PARAM_ROLE];
  }
}