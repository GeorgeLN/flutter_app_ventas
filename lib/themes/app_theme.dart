
import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Color.fromRGBO(23, 32, 42, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    )
  );
}