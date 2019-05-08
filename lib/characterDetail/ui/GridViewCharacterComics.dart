import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/carouselImages/ui/CarouselImages.dart';
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

  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    var bloc = ChatacterDetailBloc();
    print("Number of comics: ${widget.comics.items.length}");

    images = List();
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

                    //save image urls
                    images.add("${comic.thumbnail.path}.${comic.thumbnail.extension}");

                    var url = "${comic.thumbnail.path}.${comic.thumbnail.extension}"; 
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselImages(images,index)));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                          Image.network(url, fit: BoxFit.cover, height: 175.0,),
                          CustomText(text: comic.title, size: 12.0, fontWeight: FontWeight.normal, color: CustomColors.COLOR_BLACK)
                        ],),
                      ),
                    );
                  }
                },
              );
            })
      );
  
  }
}
