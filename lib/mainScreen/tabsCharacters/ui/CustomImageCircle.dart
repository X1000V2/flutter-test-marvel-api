import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/services/model/ThumbnailModel.dart';

class CustomImageCircle extends StatelessWidget {
  ThumbnailModel thumbnail;

  CustomImageCircle(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    "${thumbnail.path}.${thumbnail.extension}"))));
  }
}
