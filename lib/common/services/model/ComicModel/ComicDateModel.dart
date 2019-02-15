class ComicDateModel{
  String type;
  String date;

  static const PARAM_TYPE = "type";
  static const PARAM_DATE = "date";

  ComicDateModel.fromJson(Map json){
    this.type = json[PARAM_TYPE];
    this.date = json[PARAM_DATE];
  }
}