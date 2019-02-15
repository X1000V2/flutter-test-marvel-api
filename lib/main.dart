import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/common/AppRoutes.dart';
import 'package:flutter_test_marvel_api/mainScreen/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.ROUTE_BASE,
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          AppRoutes.ROUTE_BASE: (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          // When we navigate to the "/second" route, build the SecondScreen Widget
          AppRoutes.ROUTE_MAIN_SCREEN: (context) => MainScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  void onLoad(BuildContext context) {
    splash(context);
  }

  void splash(BuildContext context) {
    //delay 6 seconds to go main screen
    Future.delayed(Duration(milliseconds: 3000), () {
      //navigate to main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: FlareActor("animations/loading_simple_ball.flr",
                alignment: Alignment.center,
                fit: BoxFit.none,
                animation: "loading"),
          ),
          Text("Splash screen using Flare...")
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.onLoad(context);
  }
}
