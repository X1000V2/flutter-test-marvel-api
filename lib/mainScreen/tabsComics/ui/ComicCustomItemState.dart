import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/comicDetail/ui/ComicDetail.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/common/widget/PhotoHero.dart';

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
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: PhotoHero(
                photo: "${widget.comic.thumbnail.path}.${widget.comic.thumbnail.extension}",
                onTap: () => navigateToComicDetail(widget.comic),
                tag: widget.comic.hashCode.toString(),
              ),
            ),
            //price at the top of the image
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 10, bottom: 10.0),
              child: Text(
                getPrice(widget.comic),
                style: TextStyle(color: Colors.white,fontSize: 18.0),
                ),
            ),
            //Text title comic
            Wrap(children: <Widget>[
              Container(
                height: 40.0,
                color: Colors.white,
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                child: Text(
                  getTitle(widget.comic.title),
                  style: TextStyle(color: Colors.black,fontSize: 14.0),
                ),
              ),
            ],
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
      if(fullTitle.length > 35){
        title = fullTitle.substring(0,35) + "...";
      }else{
        title = fullTitle;
      }
    }

    return title;
  }

  navigateToComicDetail(ComicModel comic){
    print(comic.title);
    print("hashCode comic: ${widget.comic.hashCode.toString()}");
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>ComicDetail(comic)),
    );
  }
}
