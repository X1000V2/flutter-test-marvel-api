import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/bloc/ComicsBloc.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/ui/ComicCustomItem.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

class TabComics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabComicsState();
  }
}

class TabComicsState extends State<TabComics> {
  final bloc = ComicsBloc();

  @override
  Widget build(BuildContext context) {
    //transition duration for this screen
    timeDilation = 1.0;
    /*24 is for notification bar on Android*/
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;

    return FutureBuilder(
      future: bloc.fetchAllComics(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(CustomColors.COLOR_RED));
        } else {
          return Scrollbar(
            child: GridView.count(
              crossAxisCount: 2,
              controller: new ScrollController(keepScrollOffset: false),
              childAspectRatio: (itemWidth / itemHeight),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate((snapshot.data as List).length, (index) {
                ComicModel comic = snapshot.data[index] as ComicModel;

                return Container(
                        margin: new EdgeInsets.all(1.0),
                        child:ComicCustomItem(comic));
              }),
            ),
          );
        }
      },
    );
  }
}
