import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TabAzureLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TabAzureLoginState();
  }

}

class TabAzureLoginState extends State<TabAzureLogin>{

  String token = "";

  @override
  Widget build(BuildContext context) {
    var tenantId = "47ab2d80-6ec1-4abd-9a97-8bf01b634f1d";
    var clientId = "527795e1-1a1f-492f-bfd2-e17b18c981bc";
    var redirectUri = "https://flutterRules";

    var urlLoginAzure = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/authorize?client_id=$clientId&response_type=code&redirect_uri=$redirectUri&response_mode=query&scope=openid";
    
  var webview = WebviewScaffold(
            url: urlLoginAzure,
            clearCache: true,
            clearCookies: true,
          );

    final flutterWebviewPlugin = new FlutterWebviewPlugin();

      flutterWebviewPlugin.onUrlChanged.listen((String url) {
        if(url.startsWith(redirectUri.toLowerCase())){
            print("Token: $url");
            setState(() {
              token =url.substring(0,60);
            });        
          }
      });
    
    return Column(
      children: <Widget>[
          Container(
            height: 400.0,
            child: webview,
          ),
          Text(token),
        ],
    ); 
  }

}