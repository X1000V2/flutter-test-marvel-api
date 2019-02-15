import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';

class ComicDetail extends StatefulWidget {
  final ComicModel comic;

  ComicDetail({@required this.comic});

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
      body: Center(
          child: Text(widget.comic.title),
        ),
    );
  }
}
