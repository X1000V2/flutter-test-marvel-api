import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicCharacterModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicCreatorModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicDateModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicEventModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicImageModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicPriceModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicSeriesModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicStorieModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicTextObjectsModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicThumbnailModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicUrlsModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicVariantsModel.dart';

class ComicModel{

  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String descriptmodifiedon;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<ComicTextObjectsModel> textObjects;
  String resourceURI;
  List<ComicUrlsModel> urls;
  ComicSeriesModel series;
  List<ComicVariantsModel> variants;
  List<ComicDateModel> dates;
  List<ComicPriceModel> prices;
  ComicThumbnailModel thumbnail;
  List<ComicImageModel> images;
  ComicCreatorModel creators;
  ComicCharacterModel characters;
  ComicStorieModel stories;
  ComicEventModel events;

  static const PARAM_ID = "id";
  static const PARAM_DIGITAL_ID = "digitalId";
  static const PARAM_TITLE = "title";
  static const PARAM_ISSUE_NUMBER = "issueNumber";
  static const PARAM_VARIANT_DESCRIPTION = "variantDescription";
  static const PARAM_DESCRIPTION = "description";
  static const PARAM_MODIFIED = "modified";
  static const PARAM_ISBN = "isbn";
  static const PARAM_UPC = "upc";
  static const PARAM_DIAMOND_CODE = "diamondCode";
  static const PARAM_EAN = "ean";
  static const PARAM_ISSN = "issn";
  static const PARAM_FORMAT = "format";
  static const PARAM_PAGE_COUNT = "pageCount";
  static const PARAM_TEXT_OBJECTS = "textObjects";
  static const PARAM_RESOURCE_URI = "resourceURI";
  static const PARAM_URL = "urls";
  static const PARAM_SERIES = "series";
  static const PARAM_VARIANTS = "variants";
  static const PARAM_DATES = "dates";
  static const PARAM_PRICES = "prices";
  static const PARAM_THUMBNAIL = "thumbnail";
  static const PARAM_IMAGES = "images";
  static const PARAM_CREATORS = "creators";
  static const PARAM_CHARACTERS = "characters";
  static const PARAM_STORIES = "stories";
  static const PARAM_EVENTS ="events";


  ComicModel.fromJson(Map json){
    this.id = json[PARAM_ID];
    this.digitalId = json[PARAM_DIGITAL_ID];
    this.title = json[PARAM_TITLE];
    this.issueNumber = json[PARAM_ISSUE_NUMBER];
    this.variantDescription = json[PARAM_VARIANT_DESCRIPTION];
    this.description = json[PARAM_DESCRIPTION];
    this.modified = json[PARAM_MODIFIED];
    this.isbn = json[PARAM_ISBN];
    this.upc = json[PARAM_UPC];
    this.diamondCode = json[PARAM_DIAMOND_CODE];
    this.ean = json[PARAM_EAN];
    this.issn = json[PARAM_ISSN];
    this.pageCount = json[PARAM_PAGE_COUNT];

    this.textObjects = List();
    for(var textObject in json[PARAM_TEXT_OBJECTS]){
      this.textObjects.add(ComicTextObjectsModel.fromJson(textObject));
    }
    
    this.resourceURI = json[PARAM_RESOURCE_URI];
    
    this.urls = List();
    for(var url in json[PARAM_URL]){
      this.urls.add(ComicUrlsModel.fromJson(url));
    }

    this.series = ComicSeriesModel.fromJson(json[PARAM_SERIES]);
  
    this.variants = List();
    for(var variant in json[PARAM_VARIANTS]){
      this.variants.add(ComicVariantsModel.fromJson(variant));
    }

    this.dates = List();
    for(var date in json[PARAM_DATES]){
      this.dates.add(ComicDateModel.fromJson(date));
    }

    this.prices = List();
    for(var price in json[PARAM_PRICES]){
      this.prices.add(ComicPriceModel.fromJson(price));
    }

    this.thumbnail = ComicThumbnailModel.fromJson(json[PARAM_THUMBNAIL]);
    
    this.images = List();
    for(var image in json[PARAM_IMAGES]){
      this.images.add(ComicImageModel.fromJson(image));
    }

    this.creators = ComicCreatorModel.fromJson(json[PARAM_CREATORS]);

    this.characters = ComicCharacterModel.fromJson(json[PARAM_CHARACTERS]);

    this.stories = ComicStorieModel.fromJson(json[PARAM_STORIES]);

    this.events = ComicEventModel.fromJson(json[PARAM_EVENTS]);
    
  }
  
}