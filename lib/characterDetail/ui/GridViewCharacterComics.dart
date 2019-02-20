import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/characterDetail/bloc/ChatacterDetailBloc.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterComicsModel.dart';
import 'package:flutter_test_marvel_api/common/widget/CustomText.dart';
import 'package:progress_indicators/progress_indicators.dart';

class GridViewCharacterComics extends StatefulWidget {
  final CharacterComicsModel comics;

  GridViewCharacterComics(this.comics);

  @override
  State<StatefulWidget> createState() {
    return GridViewCharacterComicsState();
  }
}

class GridViewCharacterComicsState extends State<GridViewCharacterComics> {
  @override
  Widget build(BuildContext context) {
    var bloc = ChatacterDetailBloc();
    print("Number of comics: ${widget.comics.items.length}");

    return GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 0.50,
            controller: new ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            children: List.generate(widget.comics.items.length, (index) {
              return FutureBuilder(
                future: bloc.fetchComic(widget.comics.items[index].resourceURI),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  
                  if(snapshot.data == null){
                    return JumpingDotsProgressIndicator(
                      fontSize: 20.0,
                      );
                  }else{
                    var comic = snapshot.data as ComicModel;
                    var url = "${comic.thumbnail.path}.${comic.thumbnail.extension}"; 
                    return Padding(
                      padding: EdgeInsets.all(5.0),
                                          child: Column(
                        children: <Widget>[
                        Image.network(url, fit: BoxFit.cover, height: 175.0,),
                        CustomText(comic.title, 12.0, FontWeight.normal, CustomColors.COLOR_BLACK)
                      ],),
                    );
                  }
                },
              );
            })
      );
  
  }
}
