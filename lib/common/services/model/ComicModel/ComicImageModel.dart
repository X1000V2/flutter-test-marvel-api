class ComicImageModel{
  String path;
  String extension;

  static const PARAM_PATH = "path";
  static const PARAM_EXTENSION = "extension";

  ComicImageModel.fromJson(Map json){
    this.path = json[PARAM_PATH];
    this.extension = json[PARAM_EXTENSION];
  }
}