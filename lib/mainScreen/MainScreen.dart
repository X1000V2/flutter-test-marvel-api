import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/icons/CustomIcons.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/resources/StringsConstants.dart';
import 'package:flutter_test_marvel_api/common/widget/ColouredBottomBar/ColouredBarIcon.dart';
import 'package:flutter_test_marvel_api/common/widget/ColouredBottomBar/ColouredBottomBarWidget.dart';
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

  ColouredBottomBarWidget getColourBar() {
    return ColouredBottomBarWidget(
      indexButtonActive: bottomNavigationBarIndex,
      durationAnimationColor: 1500,
      durationAnimationSize: 1000,
      activeIconColor: Colors.white,
      disableIconColor: Colors.black,
      onIndexChanged: (index) {
        setState(() {
          bottomNavigationBarIndex = index;
        });
      },
      itemList: [
        ColouredBarIcon(
            title: StringsConstants.MAIN_SCREEN_CHARACTERS,
            iconSrc: CustomIcons.ICON_CHARACTER,
            color: Colors.red),
        ColouredBarIcon(
            title: StringsConstants.MAIN_SCREEN_COMICS,
            iconSrc: CustomIcons.ICON_COMIC,
            color: Colors.blue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.COLOR_GREY,
        title: Text(StringsConstants.MAIN_SCREEN_TITLE),
      ),
      body: Center(
        child: listScreen[bottomNavigationBarIndex],
      ),
      bottomNavigationBar: getColourBar(),
    );
  }
}
