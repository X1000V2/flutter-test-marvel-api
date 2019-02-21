import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/common/widget/PhotoHero.dart';

class CustomImageCircle extends StatefulWidget {
  final CharacterModel character;

  CustomImageCircle(this.character);

  @override
  CustomImageCircleState createState() {
    return new CustomImageCircleState();
  }
}

class CustomImageCircleState extends State<CustomImageCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: PhotoHero(
        photo: "${widget.character.thumbnail.path}.${widget.character.thumbnail.extension}",
        onTap: () => {},
        tag: widget.character.hashCode.toString(),
      ),
    );
  }
        // decoration: new BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: new DecorationImage(
        //         fit: BoxFit.fill,
        //         image: new NetworkImage(
        //             "${widget.thumbnail.path}.${widget.thumbnail.extension}"))));
  // }


  //"${widget.thumbnail.path}.${widget.thumbnail.extension}"
}
