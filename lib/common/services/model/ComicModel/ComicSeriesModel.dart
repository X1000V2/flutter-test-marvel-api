class ComicSeriesModel{
  String resourceURI;
  String name;

  static const PARAM_RESOURCE_URI = "resourceURI";
  static const PARAM_NAME = "name";

  ComicSeriesModel.fromJson(Map json){
    this.resourceURI = json[PARAM_RESOURCE_URI];
    this.name = json[PARAM_NAME];
  }
}