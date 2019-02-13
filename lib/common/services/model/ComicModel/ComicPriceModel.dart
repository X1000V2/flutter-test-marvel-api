class ComicPriceModel{
  String type;
  String price;

  static const PARAM_TYPE = "type";
  static const PARAM_PRICE = "price";

  ComicPriceModel.fromJson(Map json){
    this.type = json[PARAM_TYPE];
    this.price = json[PARAM_PRICE];
  }
}