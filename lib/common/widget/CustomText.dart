import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{

  CustomText(this.text, this.size, this.fontWeight);

  final String text;
  final double size;
  final FontWeight fontWeight;

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
        ),
      ),
    );
  }



}