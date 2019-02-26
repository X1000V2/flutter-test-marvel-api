import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/icons/CustomIcons.dart';
import 'package:flutter_test_marvel_api/common/resources/CustomColors.dart';
import 'package:flutter_test_marvel_api/common/resources/StringsConstants.dart';
import 'package:flutter_test_marvel_api/common/services/ServicesInfo.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsCharacters/ui/TabCharacters.dart';
import 'package:flutter_test_marvel_api/mainScreen/tabsComics/ui/TabComics.dart';

import 'package:aad_oauth/aad_oauth.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int bottomNavigationBarIndex = 0;
  bool firstTime = true;

  final List<Widget> listScreen = [
    TabCharacters(),
    TabComics(),
    //TODO future tabs with content
    // Text("Creators"),
    // Text("Events"),
    // Text("Stories"),
  ];

  Future<AadOAuth> loginOwn(AadOAuth oauth) async{
    await oauth.login();
    return oauth;
  }

  Future<String> getTokenOwn(AadOAuth oauth) async{
    var resultToken = await oauth.getAccessToken();
    return resultToken;
  }

  getToken(){
    var tenantId = "47ab2d80-6ec1-4abd-9a97-8bf01b634f1d";
    var clientId = "527795e1-1a1f-492f-bfd2-e17b18c981bc";

    final Config config = new Config(tenantId, clientId, "http://flutterRules");
    final AadOAuth oauth = new AadOAuth(config);
    Future<AadOAuth> a = loginOwn(oauth);
    Future<String> accessToken = getTokenOwn(oauth);
    print("TOKEN: ${accessToken}");
  }

  @override
  Widget build(BuildContext context) {
    //https://login.microsoftonline.com/common/adminconsent?client_id=6731de76-14a6-49ae-97bc-6eba6914391e&state=12345&redirect_uri=http://localhost/myapp/permissions

    //https://login.microsoftonline.com/47ab2d80-6ec1-4abd-9a97-8bf01b634f1d/oauth2/token

    //final Config config = new Config("YOUR TENANT ID", "YOUR CLIENT ID", "openid profile offline_access");
    //final Config config = new Config(ServicesInfo.CLIENT_SECRET, ServicesInfo.CLIENT_SECRET, "http://localhost:");

    if(firstTime){
      firstTime = false;
      getToken();
    }
    

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
        currentIndex:
            bottomNavigationBarIndex, // this will be set when a new tab is tapped
        onTap: (int index) {
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
