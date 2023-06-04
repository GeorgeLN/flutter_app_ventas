
import 'package:flutter/material.dart';

class AppTheme {

  //static const Color primary = Color.fromRGBO(23, 32, 42, 1);
  static const Color primary = Color.fromRGBO(28, 40, 51, 1); 

  static final ThemeData lightTheme = ThemeData.light().copyWith(

    //Appbar
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    //FloatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
    )
  );
}