import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/comicDetail/bloc/ComicDetailBloc.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicCharacterItemModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicCharacterModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/ThumbnailModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/ui/CustomImageCircle.dart';

class DisplayCharactersGridview extends StatefulWidget{

  final ComicCharacterModel characters;

  DisplayCharactersGridview(this.characters);

  @override
  DisplayCharactersGridviewState createState() {
    return new DisplayCharactersGridviewState();
  }
}

class DisplayCharactersGridviewState extends State<DisplayCharactersGridview> {
  @override
  Widget build(BuildContext context) {

    var bloc = ComicDetailBloc(); 

    /*24 is for notification bar on Android*/
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;

    return GridView.count(
              crossAxisCount: 5,
              controller: new ScrollController(keepScrollOffset: false),
              childAspectRatio: (itemWidth / itemHeight),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(widget.characters.items.length, (index) {
                return FutureBuilder(
                  future:  bloc.fetchCharacter(widget.characters.items[index].resourceURI),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.data !=null){
                      CharacterModel completeCharacter =snapshot.data as CharacterModel;
                      return CustomImageCircle(completeCharacter.thumbnail);
                      //TODO put name superhero
                    }else{
                      return  CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(CustomColors.COLOR_RED)));
                    }
                  }
                );
              }),
            );
  }
}