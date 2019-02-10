import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/icons/CustomIcons.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';

class BottomBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color(CustomColors.COLOR_RED),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset(CustomIcons.ICON_CHARACTER),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(CustomIcons.ICON_COMIC),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(CustomIcons.ICON_CREATOR),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(CustomIcons.ICON_EVENT),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(CustomIcons.ICON_STORY),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
  

}