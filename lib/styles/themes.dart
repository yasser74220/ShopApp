import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:  AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
       fontFamily: 'Jannah',
    fontSize: 15
    ),

     iconTheme: IconThemeData(
      color: Colors.black,
    ),

  ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    textTheme: TextTheme(
       button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'Jannah',
      )
    ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.shifting,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.black,
  ),
);
ThemeData dark = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      color: HexColor('333739'),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
        fontFamily: 'Jannah',
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.black,
      backgroundColor: HexColor('333739'),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: 'Jannah',

      ),
    ));