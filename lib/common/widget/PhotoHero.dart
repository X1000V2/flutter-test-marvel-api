import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.tag, this.onTap, this.width, this.height }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;
  final String tag;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.cover
            ),
          ),
        ),
      ),
    );
  }
}