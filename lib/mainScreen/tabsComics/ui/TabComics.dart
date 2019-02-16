import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_marvel_api/comicDetail/ui/ComicDetail.dart';
import 'package:flutter_test_marvel_api/common/AppRoutes.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/ComicModel/ComicModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/bloc/ComicsBloc.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/ui/ComicCustomItemState.dart';

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
                  AlwaysStoppedAnimation<Color>(Color(CustomColors.COLOR_RED)));
        } else {
          return Scrollbar(
            child: GridView.count(
              crossAxisCount: 2,
              controller: new ScrollController(keepScrollOffset: false),
              childAspectRatio: (itemWidth / itemHeight),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate((snapshot.data as List).length, (index) {
                return new Container(
                  margin: new EdgeInsets.all(1.0),
                  child: GestureDetector(
                  onTap: () {
                    //click listener
                    print((snapshot.data[index] as ComicModel).title);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ComicDetail((snapshot.data[index] as ComicModel))));
                  },
                  child:ComicCustomItem(snapshot.data[index] as ComicModel)
                  )
                );
              }),
            ),
          );
        }
      },
    );
  }
}

//child: Image.network("http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")
