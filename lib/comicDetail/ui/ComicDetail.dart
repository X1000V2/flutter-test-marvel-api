import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/comicDetail/ui/DisplayCharactersGridview.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/common/widget/CustomText.dart';
import 'package:flutter_test_marvel_api/common/widget/PhotoHero.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ComicDetail extends StatelessWidget {
  final ComicModel comic;

  ComicDetail(this.comic);

  @override
  Widget build(BuildContext context) {
    //transition duration for this screen, causer slow zoom in selected comic :D
    timeDilation = 3.0;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.COLOR_RED,
          title: Text("Comic detail"),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              //image comic
              PhotoHero(
                photo:
                    "${comic.thumbnail.path}.${comic.thumbnail.extension}",
                onTap: () => {},
                width: double.infinity,
                height: 400.0,
                tag: comic.hashCode.toString(),
              ),
              Padding(
                padding: EdgeInsets.only(
                left: 10.0, top: 10.0, right: 5.0, bottom: 5.0),
                child: Column(

                  //All details
                  children: <Widget>[
                    CustomText(text: comic.title, size: 20.0, fontWeight: FontWeight.bold, color: CustomColors.COLOR_BLACK),
                    CustomText(text: comic.description, size: 16.0, fontWeight: FontWeight.normal, color: CustomColors.COLOR_BLACK),
                    DisplayCharactersGridview(comic.characters),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
