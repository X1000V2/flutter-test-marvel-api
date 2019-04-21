import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/characterDetail/ui/CharacterDetail.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/common/widget/CustomText.dart';
import 'package:flutter_test_marvel_api/common/widget/PhotoHero.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/ui/CustomImageCircle.dart';

class CharacterRow extends StatelessWidget {
  final CharacterModel character;

  CharacterRow(this.character);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => goToCharacterDetailScreen(context),
        child: Container(
          height: 100.0,
          color: CustomColors.COLOR_PURPLE,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 35.0,
                top: 5.0,
                bottom: 5.0,
                right: 5.0,
                child: CharacterData(character),
              ),
              Positioned(
                left: 10.0,
                top: 15.0,
                bottom: 15.0,
                child: CircleImage(
                    "${character.thumbnail.path}.${character.thumbnail.extension}",
                    character.hashCode.toString()),
              )
            ],
          ),
        ));

    // ListTile(
    //     leading: CustomImageCircle(character),
    //     title: Text(character.name),
    //     subtitle: Text(getDescription(character.description)),
    //   ),
  }

  String getDescription(String description) {
    String descriptionFormatted = "";
    descriptionFormatted =
        description.length > 30 ? description.substring(0, 30) : "";
    descriptionFormatted = descriptionFormatted.length > 0
        ? (descriptionFormatted + "...")
        : "No description.";
    return descriptionFormatted;
  }

  void goToCharacterDetailScreen(BuildContext context) {
    print("HashCode TabCharacters.dart: ${character.hashCode.toString()}");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CharacterDetail(character)));
  }
}

class CircleImage extends StatelessWidget {
  final String pathImage;
  final String heroTag;

  CircleImage(this.pathImage, this.heroTag);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45.0),
      child: Container(
        width: 70.0,
        height: 70.0,
        child: PhotoHero(
          photo: pathImage,
          tag: heroTag,
        ),
      ),
    );
  }
}

class CharacterData extends StatelessWidget {
  final CharacterModel character;

  CharacterData(this.character);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        padding: EdgeInsets.only(left: 60.0,top: 10.0),
        height: 50.0,
        width: 100.0,
        color: CustomColors.COLOR_PURPLE_DARK,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomText(text: character.name, color: CustomColors.COLOR_WHITE,fontWeight: FontWeight.bold,size: 16.0,),
            Text("lorem"),
            Text("lorem"),
          ],
        ),
      ),
    );
  }
}
