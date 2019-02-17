class UrlModel{
  String type;
  String url;

  static const PARAM_TYPE = "type";
  static const PARAM_URL = "url";

  UrlModel.fromJson(Map json){
    this.type = json[PARAM_TYPE];
    this.url = json[PARAM_URL];
  }
}