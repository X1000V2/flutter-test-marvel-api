import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';

class ComicDetail extends StatefulWidget {
  final ComicModel comic;

  ComicDetail(this.comic);

  @override
  State<StatefulWidget> createState() {
    return ComicDetailState();
  }
}

class ComicDetailState extends State<ComicDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(CustomColors.COLOR_RED),
          title: Text("Comic detail"),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              //image comic
              Hero(
                    tag: widget.comic.hashCode,
                    child: Image.network(
                "${widget.comic.thumbnail.path}.${widget.comic.thumbnail.extension}",
                height: 400.0,
                width: double.infinity,
                fit: BoxFit.cover,
              )
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 5.0, bottom: 5.0),
                              child: Text(
                  "${widget.comic.title}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
                ),
              )
            ],
          ),
        ));
  }
}
