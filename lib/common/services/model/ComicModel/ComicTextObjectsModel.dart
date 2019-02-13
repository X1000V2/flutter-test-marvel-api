class ComicTextObjectsModel{
  String type;
  String language;
  String text;

  static const PARAM_TYPE = "type";
  static const PARAM_LANGUAGE = "language";
  static const PARAM_TEXT = "text";

  ComicTextObjectsModel.fromJson(Map json){
    this.type = json[PARAM_TYPE];
    this.language = json[PARAM_LANGUAGE];
    this.text = json[PARAM_TEXT];
  }
}