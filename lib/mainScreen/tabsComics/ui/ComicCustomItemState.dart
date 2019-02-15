import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';

class ComicCustomItem extends StatefulWidget {

  final ComicModel comic;

  ComicCustomItem(this.comic);

  @override
  ComicCustomItemState createState() {
    return new ComicCustomItemState();
  }
}

class ComicCustomItemState extends State<ComicCustomItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          fit: StackFit.expand,
          
          children: <Widget>[
            //Comic Image
            Container(
            margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 40),
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        "${widget.comic.thumbnail.path}.${widget.comic.thumbnail.extension}")))),
            //price at the top of the image
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              margin: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 45),
              child: Text(
                getPrice(widget.comic),
                style: TextStyle(color: Colors.white,fontSize: 18.0),
                ),
            ),
            //Text title comic
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.only(left: 5, top: 150, right: 5, bottom: 5),
              child: Text(
                getTitle(widget.comic.title),
                style: TextStyle(color: Colors.black,fontSize: 14.0),
                ),
            )
          ],
        );
  }

  String getPrice(ComicModel comic){
    String price = "";
    price = comic.prices != null ? comic.prices.first != null ? comic.prices.first.price.toStringAsFixed(2): "":"";

    if(price.length > 0){
      price = price + '€';
    }
    return price;
  }

  String getTitle(String fullTitle){
    String title = "";

    if(fullTitle != null){
      if(fullTitle.length > 41){
        title = fullTitle.substring(0,41) + "...";
      }else{
        title = fullTitle;
      }
    }

    return title;
  }
}