import 'package:mathforkids/utils/Imports.dart';
import 'package:flutter/material.dart';

bool dark = false;

ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromRGBO(115, 226, 167, 1),
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    buttonColor: Color.fromRGBO(115, 226, 167, 1),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
    accentColor: Colors.black,
);

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.green[600],
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(31, 69, 82, 1),
    buttonColor: Colors.green[600],
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
    accentColor: Colors.white,
);

ThemeData setTheme = ThemeData(
  primaryColor: Colors.green[600],
  brightness: Brightness.dark,
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
  scaffoldBackgroundColor: Color.fromRGBO(31, 69, 82, 1),
  buttonColor: Colors.green[600],
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
    accentColor: Colors.white,
);

void switchTheme()
{
  if(dark)
    {
      dark = false;
      setTheme = darkTheme;
    }
  else
    {
      dark = true;
      setTheme = lightTheme;
    }
}

