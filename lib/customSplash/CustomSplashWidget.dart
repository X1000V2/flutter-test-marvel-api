import 'package:flutter/material.dart';
import 'package:flutter_test_marvel_api/customSplash/SplashPainter.dart';

class CustomSplashWidget extends StatefulWidget {
  final String imageSrc;
  VoidCallback onTapCustom;
  final int tapsToTrigger;

  CustomSplashWidget({this.imageSrc, this.onTapCustom, this.tapsToTrigger});

  @override
  State<StatefulWidget> createState() {
    return CustomSplashState();
  }
}

class CustomSplashState extends State<CustomSplashWidget>
    with SingleTickerProviderStateMixin {
  double _factionTime = 0.0;
  Animation<double> animation;
  int numberOfClickToJumpToNextScreen = 0;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    animation.addListener(() {
      setState(() {
        _factionTime = animation.value;
      });
    });

    animation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          _animationController.reverse();
          break;
        case AnimationStatus.dismissed:
          _animationController.forward();
          break;
        default:
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SplashPainter(fractionTime: _factionTime),
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(),
            //Text("_fractionTime: $_factionTime"),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: GestureDetector(
                  onTap: () {
                    numberOfClickToJumpToNextScreen++;
                    print(
                        "Numb to jump to next screen $numberOfClickToJumpToNextScreen");
                    if (numberOfClickToJumpToNextScreen ==
                        widget.tapsToTrigger) {
                      widget.onTapCustom();
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 250.0 *
                              (1.3 - _factionTime) *
                              (0.9 + 0.2 * numberOfClickToJumpToNextScreen),
                          width: 250.0 *
                              (1.3 - _factionTime) *
                              (0.9 + 0.2 * numberOfClickToJumpToNextScreen),
                          child: Image.asset(widget.imageSrc))
                    ],
                  )),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 50.0,
              child: Center(child: Text("Tap Iron Man´s headfive times to enter...")),
            ),
          ],
        ),
      ),
    );
  }
}
