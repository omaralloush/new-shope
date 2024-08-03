import 'package:new_shope/core/constants/colors.dart' as Appcolors;
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    primaryColor: Appcolors.kLightPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Appcolors.kBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Appcolors.kLightSecondaryColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Appcolors.kLightTextColor,
    )),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Appcolors.kLightSecondaryColor)),
    colorScheme: ColorScheme.light(secondary: Appcolors.kLightSecondaryColor),
  );

  // static final darkTheme = ThemeData(
  //     brightness: Brightness.dark,
  //     primaryColor: darkPrimaryColor,
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     textButtonTheme: TextButtonThemeData(
  //         style: TextButton.styleFrom(foregroundColor: darkTextColor)),
  //     colorScheme: ColorScheme.light(secondary: lightSecondaryColor)
  //         .copyWith(background: darkBackgroundColor));
}
