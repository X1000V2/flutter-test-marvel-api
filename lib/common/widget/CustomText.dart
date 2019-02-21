import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{

  //CustomText(this.text, this.size, this.fontWeight);

  CustomText(this.text, this.size, this.fontWeight, this.color);

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: Text(
        text !=null ? text : "",//check if text is null
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color
        ),
      ),
    );
  }



}