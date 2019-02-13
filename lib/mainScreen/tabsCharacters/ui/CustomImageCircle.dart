import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/ThumbnailModel.dart';

class CustomImageCircle extends StatefulWidget {
  final ThumbnailModel thumbnail;

  CustomImageCircle(this.thumbnail);

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
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    "${widget.thumbnail.path}.${widget.thumbnail.extension}"))));
  }
}
