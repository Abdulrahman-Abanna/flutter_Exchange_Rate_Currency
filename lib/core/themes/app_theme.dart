import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme:
        IconThemeData(color: Color.fromRGBO(238, 187, 195, 1), size: 27.0),
    titleTextStyle: TextStyle(
      color: Color.fromRGBO(255, 255, 254, 1),
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(35, 41, 70, 1),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color.fromRGBO(35, 41, 70, 1),
    elevation: 0.0,
  ),

);
