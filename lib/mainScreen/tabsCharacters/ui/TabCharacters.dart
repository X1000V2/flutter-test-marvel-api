import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/characterDetail/ui/CharacterDetail.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/bloc/CharacterBloc.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/ui/CustomImageCircle.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

class TabCharacters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabCharactersState();
  }
}

class TabCharactersState extends State<TabCharacters> {
  final bloc = CharacterBloc();

  @override
  Widget build(BuildContext context) {

    timeDilation = 1.0;

    return FutureBuilder(
      future: bloc.fetchAllCharacters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(CustomColors.COLOR_RED));
        } else {
          return Scrollbar(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: (){
                    //Go to chatacter detail with the character
                    print("HashCode TabCharacters.dart: ${(snapshot.data[index] as CharacterModel).hashCode.toString()}");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetail((snapshot.data[index] as CharacterModel))));
                  },
                  leading: CustomImageCircle((snapshot.data[index] as CharacterModel)),
                  title: Text((snapshot.data[index] as CharacterModel).name),
                  subtitle: Text(bloc.getDescription((snapshot.data[index] as CharacterModel).description)),
                );
              },
            ),
          );
        }
      },
    );
  }
}
