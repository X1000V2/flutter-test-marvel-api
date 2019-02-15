import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_marvel_api/comicDetail/ui/ComicDetail.dart';
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
    return FutureBuilder(
      future: bloc.fetchAllComics(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Color(CustomColors.COLOR_RED)));
        } else {
          return Scrollbar(
            child: GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.6),
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    //click listener
                    print((snapshot.data[index] as ComicModel).title);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ComicDetail(comic: (snapshot.data[index] as ComicModel))));
                  },
                  child: ComicCustomItem((snapshot.data[index] as ComicModel)),
                );
              },
            ),
          );
        }
      },
    );
  }
}
