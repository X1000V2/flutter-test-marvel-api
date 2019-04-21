import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/common/widget/PhotoHero.dart';

class CustomImageCircle extends StatelessWidget {
  final CharacterModel character;

  CustomImageCircle(this.character);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 50.0,
      height: 50.0,
      child: PhotoHero(
        photo: "${character.thumbnail.path}.${character.thumbnail.extension}",
        onTap: () => {},
        tag: character.hashCode.toString(),
      ),
    );
  }
}
