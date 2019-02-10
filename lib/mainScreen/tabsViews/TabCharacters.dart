import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/services/ServiceManager.dart';
import 'package:flutter_test_marvel_api/common/services/model/CharacterModel.dart';

class TabCharacters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabCharactersState();
  }
}

class TabCharactersState extends State<TabCharacters> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceManager.getCharactersFromService(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(CustomColors.COLOR_RED)));
          } else {
            return Scrollbar(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text((snapshot.data[index] as CharacterModel).name),
                  );
                },
              ),
            );
          }
        },
      );
  }
}
