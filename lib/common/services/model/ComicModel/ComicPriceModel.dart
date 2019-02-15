class ComicPriceModel{
  String type;
  double price;

  static const PARAM_TYPE = "type";
  static const PARAM_PRICE = "price";

  ComicPriceModel.fromJson(Map json){
    this.type = json[PARAM_TYPE];
    this.price = double.parse(json[PARAM_PRICE].toString());
  }
}