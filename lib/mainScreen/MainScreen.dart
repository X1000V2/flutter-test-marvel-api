import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/icons/CustomIcons.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/resources/StringsConstants.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/ui/TabCharacters.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/ui/TabComics.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {

  int bottomNavigationBarIndex = 0;

  final List<Widget> listScreen = [
    TabCharacters(),
    TabComics(),
    //TODO future tabs with content
    // Text("Creators"),
    // Text("Events"),
    // Text("Stories"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.COLOR_RED,
        title: Text(StringsConstants.MAIN_SCREEN_TITLE),
      ),
      body: Center(
        child: listScreen[bottomNavigationBarIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: CustomColors.COLOR_RED,
        currentIndex: bottomNavigationBarIndex, // this will be set when a new tab is tapped
        onTap: (int index){
          setState(() {
            bottomNavigationBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(CustomIcons.ICON_CHARACTER,
                width: 40.0, height: 40.0),
            title: new Text(StringsConstants.MAIN_SCREEN_CHARACTERS),
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset(CustomIcons.ICON_COMIC, width: 40.0, height: 40.0),
            title: new Text(StringsConstants.MAIN_SCREEN_COMICS),
          ),
          //TODO create more tabs with content
          /* BottomNavigationBarItem(
            icon: Image.asset(CustomIcons.ICON_CREATOR,
                width: 40.0, height: 40.0),
            title: new Text(StringsConstants.MAIN_SCREEN_CREATORS),
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset(CustomIcons.ICON_EVENT, width: 40.0, height: 40.0),
            title: new Text(StringsConstants.MAIN_SCREEN_EVENTS),
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset(CustomIcons.ICON_STORY, width: 40.0, height: 40.0),
            title: new Text(StringsConstants.MAIN_SCREEN_STORIES),
          ), */
        ],
      ),
    );
  }
}
