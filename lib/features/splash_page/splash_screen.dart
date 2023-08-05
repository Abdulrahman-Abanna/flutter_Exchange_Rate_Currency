import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/localization/language/languages.dart';
import '../currencies/presentation/pages/home_screen.dart';

class SplashScrean extends StatefulWidget {
  @override
  _SplashScreanState createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _b = true;
      });
    });
    Timer(Duration(milliseconds: 2300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 5400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 5850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          FadeRoute(
            route: HomeScreen(),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 41, 70, 1),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? _h / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? _w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius:
                      _d ? BorderRadius.only() : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            Languages.of(context)!.Gold_Currencey_Prices,                            
                            textAlign: TextAlign.center,
                            duration: Duration(milliseconds: 1700),
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget? route;

  FadeRoute({this.page, this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page as Widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
