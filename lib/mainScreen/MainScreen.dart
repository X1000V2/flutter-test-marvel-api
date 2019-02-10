
import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/resources/StringsConstants.dart';
import 'package:flutter_test_marvel_api/mainScreen/BottomBar.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
		appBar: AppBar(
      backgroundColor: Color(CustomColors.COLOR_RED),
			title: Text(StringsConstants.MAIN_SCREEN_TITLE),
		),
		body: Center(
			child: Text(StringsConstants.MAIN_SCREEN_TITLE),
		),
    bottomNavigationBar: BottomBar(),
	);
  }

}