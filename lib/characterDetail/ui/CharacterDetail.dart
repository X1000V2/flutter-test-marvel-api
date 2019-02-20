import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/characterDetail/ui/GridViewCharacterComics.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/resources/StringsConstants.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/common/widget/CustomText.dart';
import 'package:flutter_test_marvel_api/common/widget/PhotoHero.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

class CharacterDetail extends StatefulWidget{

  final CharacterModel character;

  CharacterDetail(this.character);

  @override
  State<StatefulWidget> createState() {
    
    return CharacterDetailState();
  }

}

class CharacterDetailState extends State<CharacterDetail>{

  @override
  Widget build(BuildContext context) {

    timeDilation = 3.0;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.COLOR_RED,
        title: Text(StringsConstants.CHARACTER_DETAIL_SCREEN_TITLE),
      ),
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                //Red Header
                Container(
                  height: 100.0,
                  color: CustomColors.COLOR_RED,
                ),
                //Character description
                Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 5.0, right: 5.0),
                  child: CustomText(widget.character.description, 16.0, FontWeight.normal, CustomColors.COLOR_BLACK),
                ),
                //Comics available for this character
                GridViewCharacterComics(widget.character.comics),
              ],
            ),
            //Image Character
            Positioned(
              left: 20.0,
              top: 20.0,
              height: 150.0,
              width: 150.0,
              child: PhotoHero(
                  photo: "${widget.character.thumbnail.path}.${widget.character.thumbnail.extension}",
                  onTap: () => {},
                  tag: widget.character.hashCode.toString(),
                ),
            ),
            //Name Character
            Positioned(
              left: 200.0,
              top: 30.0,
              right: 10.0,
              child: CustomText(widget.character.name,22.0,FontWeight.bold, CustomColors.COLOR_WHITE),
            ),
            //Total comics number
            Positioned(
              right: 10.0,
              left: 200.0,
              top: 120.0,
              child: CustomText("Total comics ${widget.character.comics.items.length}",18.0,FontWeight.bold, CustomColors.COLOR_BLACK),
            )
          ],
        ),
      ),
    );
  }

}