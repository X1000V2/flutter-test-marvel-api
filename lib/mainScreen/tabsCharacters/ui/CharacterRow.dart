import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/characterDetail/ui/CharacterDetail.dart';
import 'package:flutter_test_marvel_api/common/services/model/characterModels/CharacterModel.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/ui/CustomImageCircle.dart';

class CharacterRow extends StatelessWidget{

  final CharacterModel character;

  CharacterRow(this.character);

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
                  onTap: (){
                    //Go to chatacter detail with the character
                    print("HashCode TabCharacters.dart: ${character.hashCode.toString()}");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetail(character)));
                  },
                  leading: CustomImageCircle(character),
                  title: Text(character.name),
                  subtitle: Text(getDescription(character.description)),
                );
  }

  String getDescription(String description){
    String descriptionFormatted = "";
    descriptionFormatted = description.length > 30 ? description.substring(0,30) : "";
    descriptionFormatted = descriptionFormatted.length > 0 ? (descriptionFormatted + "..."):"No description.";
    return descriptionFormatted;
  }

}