class ThumbnailModel{

  String path;
  String extension;

  static const String PARAM_PATH = "path";
  static const String PARAM_EXTENSION = "extension";

  ThumbnailModel(this.path, this.extension);

  ThumbnailModel.fromJson(Map json){
    this.path = json[PARAM_PATH];
    this.extension = json[PARAM_EXTENSION];
  }
}